# frozen_string_literal: true

class NewslettersController < ApplicationController
  # skip_before_action :authenticate_user!
  # before_action :set_newsletter, only: [:destroy]

  def create
    @newsletter = Newsletter.create(newsletter_params)
    if @newsletter.save
      redirect_to root_path, notice: 'Email was successfully subscribed.'
    else
      redirect_to root_path
    end
  end

  private

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
