# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true,
                      length: { minimum: 5 }
  belongs_to :user
  # rubocop:disable all
  has_and_belongs_to_many :labels, dependent: :destroy
  # rubocop:enable all

  def add_labels(label_ids)
    labels = Label.where(id: label_ids)
    self.labels << labels
  end

  def add_user(user)
    self.user_id = user
  end

  def update_labels(label_ids)
    labels = Label.where(id: label_ids)
    self.labels = labels
  end
end
