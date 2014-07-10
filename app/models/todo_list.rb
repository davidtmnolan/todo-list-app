class TodoList < ActiveRecord::Base
	belongs_to :user
	has_many :todo_items, dependent: :destroy
	
	validates :title, presence: true, length: { minimum: 3 }

  scope :pending, -> { where(completed: nil) }
  scope :completed, -> { where(completed: true).order('updated_at ASC') }
  
  def empty?
    todo_items.empty?
  end
  
  def mark_as_completed_if_all_items_are_completed
    if reload.todo_items.all?(&:completed?)
      update(completed: true)
    else
      update(completed: nil)
    end
  end
end
