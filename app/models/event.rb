class Event < ApplicationRecord
  belongs_to :user

  def multi_day_event?
    start_time.to_date != end_time.to_date
  end
end
