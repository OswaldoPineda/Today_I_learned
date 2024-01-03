# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@tildev.com'
  layout 'mailer'
end
