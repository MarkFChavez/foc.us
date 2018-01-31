class Event < ApplicationRecord
  module Contracts
    class Create < Reform::Form
      property :name
      property :start_time
      property :end_time
      validates :name, :start_time, :end_time, presence: true
    end
  end
end
