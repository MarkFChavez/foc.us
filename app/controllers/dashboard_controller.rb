class DashboardController < ApplicationController
  def index
    @notes = current_user.notes.latest
    @todos = current_user.todos.latest
  end
end
