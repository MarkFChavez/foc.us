class Note < ApplicationRecord
  validates :description, presence: true

  has_many :item_categories, as: :subject, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :user

  scope :latest, -> { order(created_at: :desc) }
end
