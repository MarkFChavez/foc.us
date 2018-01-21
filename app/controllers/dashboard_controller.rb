class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @notes = current_user.notes
    @todos = current_user.todos
  end
end
