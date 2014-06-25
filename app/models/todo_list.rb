class TodoList < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 2}
	has_many :todo_items, dependent: :destroy
end
