# frozen_string_literal: true

# Represents a label associated with posts.
# Labels can be used to categorize and organize posts
class Label < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :posts

  class << self
    def find_by_variants(name)
      return nil if name.blank?

      search_options = [name.downcase, name.upcase, name.capitalize, name.titleize]
      find_by_name_variants(search_options)
    end

    def find_by_name_variants(search_options)
      where('name ILIKE ANY (array[?])', search_options).first
    end
  end
end
