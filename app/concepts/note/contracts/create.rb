class Note < ApplicationRecord
  module Contracts
    class Create < Reform::Form
      property :description
      validates :description, presence: true
    end
  end
end
