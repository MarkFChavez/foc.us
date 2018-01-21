class DashboardController < ApplicationController
  def index
    @notes = current_user.notes
    @todos = current_user.todos
  end
end
