# frozen_string_literal: true

# Root information source
class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 5 }
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
    label = find_or_create_label(name)
    self.labels = [label].compact
  end

  private

  def create_new_label(name)
    Label.create(name: name.titleize).tap { |new_label| labels << new_label }
  end

  def find_or_create_label(name)
    return Label.find_by_variants(name) if label_exists?(name)
    return nil if name.blank?

    create_new_label(name)
  end

  def label_exists?(name)
    Label.find_by_variants(name).present?
  end
end
