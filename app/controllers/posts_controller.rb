# frozen_string_literal: true

# Service to download ftp files from the server
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /posts or /posts.json
  def index
    @posts = Post.all
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
  # rubocop:disable all
  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])
    @post.add_user(current_user.id)
    @post.add_labels(params[:post][:label_ids])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable all

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.update_labels(params[:post][:label_ids])

    respond_to do |format|
      if @post.update(title: params[:post][:title], content: params[:post][:content])
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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
