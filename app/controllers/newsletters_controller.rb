# frozen_string_literal: true

class NewslettersController < ApplicationController
  def create
    @newsletter = Newsletter.find_or_initialize_by(newsletter_params)

    if @newsletter.new_record?
      create_subscription_and_redirect(@newsletter)
    end

    if @newsletter.subscription
      redirect_to_root_with_success 'Email was already subscribed.'
    elsif @newsletter.update(subscription: true)
      redirect_to_root_with_success 'Email was successfully subscribed.'
    end
  end

  def unsubscribe
    email = Base64.strict_decode64(params[:email])
    @newsletter = Newsletter.find_by(email: email)
  end

  def update
    @newsletter = Newsletter.find_by(email: params[:email])
    if @newsletter.update(subscription: false)
      redirect_to_root_with_success 'Subscription Cancelled'
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

  def redirect_to_root_with_success(message)
    redirect_to root_url, notice: message
  end

  def create_subscription_and_redirect
    @newsletter.save
    redirect_to_root_with_success 'Email was successfully subscribed.'
  end
end
