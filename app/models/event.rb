class Event < ApplicationRecord
  belongs_to :user
  validates :name, :start_time, :end_time, presence: true

  def multi_day_event?
    start_time.to_date != end_time.to_date
  end
end
