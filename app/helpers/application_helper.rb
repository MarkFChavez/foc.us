module ApplicationHelper
  DEFAULT_TIMEZONE = "Asia/Manila"

  def format_date(date)
    date.in_time_zone(DEFAULT_TIMEZONE).strftime("%m/%d/%Y")
  end
end
