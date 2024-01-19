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

  def unsubscribe
    email = Base64.strict_decode64(params[:email])
    @newsletter = Newsletter.find_by(email: email)
  end

  def update
    @newsletter = Newsletter.find_by(email: params[:email])
    if @newsletter.update(subscription: false)
      redirect_to root_url, notice: 'Subscription Cancelled'
    else
      render :unsubscribe, alert: 'There was a problem, try again latter'
    end
  end

  private

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:email, :subscription)
  end
end
