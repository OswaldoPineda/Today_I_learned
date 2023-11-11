# frozen_string_literal: true

# Service to download ftp files from the server
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authorize_user, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: %i[user_posts]

  def index
    @posts = current_user.posts.order('id DESC').page params[:page]
  end

  def user_posts
    user = User.find_by(id: params[:id])

    if user
      @posts = user.posts.order('id DESC').page params[:page]
    else
      redirect_to root_path
    end
  end

  def show; end

  def new
    @post = Post.new
    @labels = Label.all
  end

  def edit
    post = Post.find(params[:id])
    @label = post.labels.first
  end

  def create
    @post = build_post

    if @post.save
      redirect_to_post_with_success('Post was successfully created.')
    else
      render :new
    end
  end

  def update
    @post.update_label(params[:post][:label_name])

    if @post.update(title: params[:post][:title], content: params[:post][:content])
      redirect_to_post_with_success('Post was successfully updated.')
    else
      @labels = Label.all
      render :edit
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :label_name)
  end

  def build_post
    post = Post.new(title: post_params[:title], content: post_params[:content])
    post.add_user(current_user)
    post.add_labels(post_params[:label_name])

    post
  end

  def save_post
    @post.add_user(current_user.id)
    @post.add_labels(params[:post][:label_name])
    @post.save
  end

  def redirect_to_post_with_success(message)
    redirect_to post_url(@post), notice: message
  end

  def authorize_user
    unless current_user == @post.user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to posts_path
    end
  end
end
