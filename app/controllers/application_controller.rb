class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  layout :set_layout

  def set_layout
    user_signed_in? ? "application" : "not_authenticated"
  end
end
