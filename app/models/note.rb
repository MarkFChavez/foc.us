class Note < ApplicationRecord
  validates :description, presence: true
  belongs_to :user

  scope :latest, -> { order(created_at: :desc) }
end
