class TodoListsController < ApplicationController
	before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
	
	def index
		@todo_lists = current_user.todo_lists.all
	end
	
	def show
		#DAFUG!?
		render 'todo_items/index'
	end
	
	def new
		@todo_list = current_user.todo_lists.new
	end
	
	def create
		@todo_list = current_user.todo_lists.new(todo_list_params)
		if @todo_list.save
			redirect_to todo_lists_path
			flash[:success] = "List Created"
			else
				render :new
		end
	end
	
	def update
		
	end
	
	def destroy
		@todo_list = TodoList.find(params[:id])
		@todo_list.destroy
		
		redirect_to todo_lists_path, notice: "List Destroyed"
	end
	
	
	private

	def set_todo_list
		@todo_list = current_user.todo_lists.find_by(params[:id])
	end
		
	def todo_list_params
		params.require(:todo_list).permit(:title)
	end
	
end
