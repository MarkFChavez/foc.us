class Todo < ApplicationRecord
  validates :description, presence: true

  has_many :action_items, inverse_of: :todo, dependent: :destroy
  has_many :item_categories, as: :subject, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :user

  scope :latest, -> { order(created_at: :desc) }

  accepts_nested_attributes_for :action_items, reject_if: :all_blank, allow_destroy: true
end
