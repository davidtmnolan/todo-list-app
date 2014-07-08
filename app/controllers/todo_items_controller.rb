class TodoItemsController < ApplicationController
  before_action :set_todo_list
  
  def index
    @todo_items = @todo_list.todo_items.order("created_at desc")
  end
  
  def new
    @todo_item = @todo_list.todo_items.build
  end
  
  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      respond_to do |format|
        format.html { redirect_to todo_list_todo_items_path }
        format.js
      end
        flash[:success] = "Item added"
    else
      flash[:error] = "Unable to create item"
      render action: :new
    end
  end
  
  def edit 
    @todo_item = @todo_list.todo_items.find(params[:id])
  end
  
  def update
    @todo_item = @todo_list.todo_items.find(params[:id])

    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Successfully Updated"
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "Unable to update"
      render action: :edit
    end
  end
  
  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      respond_to do |format|
        format.js
        flash[:success] = "Item destroyed"
      end
    else
      flash[:error] = "Item couldn't be destroyed"
    end
  end
  
  def complete
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.complete!
    respond_to do |format|
      format.js
    end
    flash[:success] = "Item marked as completed"
  end
  
  private
    def set_todo_list
      @todo_list = current_user.todo_lists.find(params[:todo_list_id])
    end
  
    def todo_item_params
      params.require(:todo_item).permit(:content)
    end
end
