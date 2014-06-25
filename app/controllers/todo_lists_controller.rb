class TodoListsController < ApplicationController
	before_action :require_user
	before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
	
	def index
		@todo_lists = current_user.todo_lists
	end
	
	def show
	end
	
	def new
		@todo_list = current_user.todo_lists.new
	end
	
	def create
		@todo_list = current_user.todo_lists.new(todo_list_params)
		if @todo_list.save
			redirect_to @todo_list
			flash[:success] = "Success"
			else
				render :new
		end
	end
	
	def show 
		@todo_list = TodoList.find(params[:id])
	end
	
	def update
		
	end
	
	def destroy
		@todo_list = TodoList.find(params[:id])
		@todo_list.destroy
		
		redirect_to todo_list_path, notice: "Winning"
	end
	
	
	private
		
	def set_todo_list
		@todo_list = current_user.todo_lists.find(params[:id])
	end
		
		def todo_list_params
			params.require(:todo_list).permit(:title)
		end
	
end
