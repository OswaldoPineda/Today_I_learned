require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron('0 8 * * 1') do
    UserMailer.newsletter_mailer.deliver!
end