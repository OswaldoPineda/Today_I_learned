# frozen_string_literal: true

class Label < ApplicationRecord
  validates :name, presence: true
  # rubocop:disable all
  has_and_belongs_to_many :posts
  # rubocop:enable all
end
