class Dashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def notes
    user.notes.latest.includes(:categories)
  end

  def todos
    user.todos.latest.includes(:action_items)
  end
end
