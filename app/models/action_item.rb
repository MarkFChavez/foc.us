class ActionItem < ApplicationRecord
  validates :description, presence: true
  belongs_to :todo
end
