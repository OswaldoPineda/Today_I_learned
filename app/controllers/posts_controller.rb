# frozen_string_literal: true

# Service to download ftp files from the server
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[user_posts]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order("id DESC").page params[:page]
  end

  def user_posts
    user = User.find_by(id: params[:id])

    if user
      @posts = user.posts.order("id DESC").page params[:page]
    else
      redirect_to root_path
    end
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
    @labels = Label.all
  end

  # GET /posts/1/edit
  def edit
    @labels = Label.all
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])
    @post.add_user(current_user.id)
    @post.add_labels(params[:post][:label_ids])

    if @post.save
      redirect_to post_url(@post), notice: 'Post was successfully created.'
    else
      @labels = Label.all
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.update_labels(params[:post][:label_ids])

    if @post.update(title: params[:post][:title], content: params[:post][:content])
      redirect_to post_url(@post), notice: 'Post was successfully updated.'
    else
      @labels = Label.all
      render :edit
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content, :label_ids)
  end
end
