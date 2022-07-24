# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'This is a title test' }
    content { 'This is a content test.' }
  end
end
