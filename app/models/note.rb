class Note < ApplicationRecord
  has_many :item_categories, as: :subject, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :user

  scope :latest, -> { order(updated_at: :desc) }
end
