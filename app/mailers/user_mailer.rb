# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def newsletter_mailer
    @newsletter = Newsletter.all
    @post = Post.last(5)
    emails = @newsletter.collect(&:email).join(", ")
    mail(to: emails, subject: "Hi, this is a test mail.")
  end
end
