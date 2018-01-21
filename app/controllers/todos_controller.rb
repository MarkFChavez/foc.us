class TodosController < ApplicationController
  def new
    @todo = Todo.new
    3.times { @todo.action_items.build }
  end

  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:description, :action_items_attributes => [:id, :description])
    end
end
