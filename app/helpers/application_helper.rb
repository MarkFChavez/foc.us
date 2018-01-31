module ApplicationHelper
  DEFAULT_TIMEZONE = "Asia/Manila"

  def format_date(date)
    to_timezone(date).strftime("%m/%d/%Y")
  end

  def format_time(date)
    to_timezone(date).strftime("%I:%M%p")
  end

  private

    def to_timezone(date)
      date.in_time_zone(DEFAULT_TIMEZONE)
    end
end
