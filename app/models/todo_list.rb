class TodoList < ActiveRecord::Base
	
	scope :newest, -> { order("created_at DESC") }
	
	validates :title, presence: true, length: { minimum: 2}
	has_many :todo_items, dependent: :destroy
	belongs_to :user
	
	def items_completed
		todo_items.complete.size
	end
	
	def size
		todo_items.size
	end
end
