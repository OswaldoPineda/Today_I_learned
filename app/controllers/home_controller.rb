# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @labels = Label.all
    posts = label_params[:label_id].present? ? Post.joins(:labels).where(labels: { id: label_params[:label_id] }) : Post.all

    @posts = posts.order("id DESC").page params[:page]
  end

  private

  def label_params
    params.permit(:label_id)
  end
end
