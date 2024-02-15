# frozen_string_literal: true

# Root information source
class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_and_belongs_to_many :labels, dependent: :destroy
  has_rich_text :content

  def add_labels(name)
    return unless name

    label = Label.find_by_variants(name)
    labels << (label || Label.create(name: name.titleize))
  end

  def add_user(user)
    self.user = user
  end

  def update_label(name)
    return unless name

    label = Label.find_by_variants(name)

    begin
      self.labels = [label || Label.create!(name: name.titleize)]
    rescue ActiveRecord::RecordInvalid
      errors.add(:label, 'is invalid')
    end
  end
end
