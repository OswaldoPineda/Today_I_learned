# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'Test Name' }
    email { 'test@factory.com' }
    password { 'test1234' }
  end
end
