class TodoListsController < ApplicationController
	
	def index
		@todo_lists = TodoList.all
	end
	
	def new
		@todo_list = TodoList.new
	end
	
	def create
		@todo_list = TodoList.new(todo_list_params)
		if @todo_list.save
			redirect_to todo_lists_url 
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
		
		def todo_list_params
			params.require(:todo_list).permit(:title)
		end
	
end
