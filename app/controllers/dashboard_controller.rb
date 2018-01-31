class DashboardController < ApplicationController
  def index
    @notes = current_user.notes.latest.includes(:categories)
    @todos = current_user.todos.latest.includes(:action_items)
  end
end
