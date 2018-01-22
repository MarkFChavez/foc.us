class Todo < ApplicationRecord
  validates :description, presence: true

  has_many :action_items, dependent: :destroy
  belongs_to :user

  scope :latest, -> { order(created_at: :desc) }

  accepts_nested_attributes_for :action_items
end
