# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.ordered.all.page params[:page]
  end
end
