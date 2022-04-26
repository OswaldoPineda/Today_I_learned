# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true,
                      length: { minimum: 5 }
  belongs_to :user
end
