# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.all.order("id DESC").page params[:page]
  end
end
