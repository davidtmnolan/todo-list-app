class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  
  def index
    @todo_lists = current_user.todo_lists.paginate(:page => params[:page], :per_page => 8).order('created_at desc')
  end

  def new
    @todo_list = current_user.todo_lists.new
  end

  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)

    if @todo_list.save
      respond_to do |format|
        format.html { redirect_to todo_list_todo_items_path(@todo_list) }
      end
      flash[:success] = "List Created"
    else
      redirect_to todo_lists_url
      flash[:error] = "List must be atleast 3 characters"
    end

  end

  def update

  end

  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_todo_list
    @todo_list = current_user.todo_lists.find_by(params[:id])
  end
  
  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
