class Todo < ApplicationRecord
  validates :description, presence: true

  has_many :action_items, inverse_of: :todo, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :action_items
end