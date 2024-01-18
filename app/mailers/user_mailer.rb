# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def newsletter_mailer
    @newsletter = Newsletter.where('subscription = ?', true)
    @post = Post.order('RANDOM()').limit(5)
    emails = @newsletter.collect(&:email).join(", ")
    mail(to: emails, subject: "Weekly Today I Learn Posts.")
  end
end
