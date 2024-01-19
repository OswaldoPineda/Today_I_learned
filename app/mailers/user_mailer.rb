# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def newsletter_mailer
    @newsletter = Newsletter.where('subscription = ?', true)
    @post = Post.order('RANDOM()').limit(5)
    @newsletter.each do |subscriber|
      @email_encoded = Base64.strict_encode64(subscriber.email)
      mail(to: subscriber.email, subject: "Weekly Today I Learn Posts.")
    end
  end
end
