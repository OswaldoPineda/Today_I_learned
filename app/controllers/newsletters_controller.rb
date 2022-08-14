# frozen_string_literal: true

class NewslettersController < ApplicationController
  def create
    if Newsletter.find_by(newsletter_params)
      redirect_to root_path, notice: 'Email was already subscribed.'
      return
    end

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
