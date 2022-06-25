# frozen_string_literal: true

class Label < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :posts
end
