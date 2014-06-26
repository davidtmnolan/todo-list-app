class TodoList < ActiveRecord::Base
	
	scope :newest, -> { order("created_at DESC") }
	
	validates :title, presence: true, length: { minimum: 2}
	has_many :todo_items, dependent: :destroy
	belongs_to :user
	
	def empty_list?
		todo_items.count == 0
	end
	
	def has_completed_items?
		todo_items.complete.size > 0
	end
	
	def items_completed
		todo_items.complete.size
	end
	
	def size
		todo_items.size
	end
end
