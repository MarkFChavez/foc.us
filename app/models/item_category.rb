class ItemCategory < ApplicationRecord
  belongs_to :category
  belongs_to :subject, polymorphic: true
end