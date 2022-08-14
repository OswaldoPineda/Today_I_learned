# frozen_string_literal: true

desc 'weekly newsletter email'

task weekly_newsletter_email: :environment do
  UserMailer.newsletter_mailer.deliver!
end
