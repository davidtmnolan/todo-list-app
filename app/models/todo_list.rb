class TodoList < ActiveRecord::Base
	belongs_to :user
	has_many :todo_items, dependent: :destroy
	
	validates :title, presence: true, length: { minimum: 2 }

  def empty?
    todo_items.empty?
  end

  def completed?
    todo_items.all?(&:completed?)
  end
end
