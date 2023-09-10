# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'This is a title test' }
    content { 'This is a content test.' }

    trait :with_user do
      user_id { FactoryBot.create(:user, username: 'Test Post', email: 'post@factory.com').id }
    end
  end
end
