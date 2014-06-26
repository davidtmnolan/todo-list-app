class TodoItem < ActiveRecord::Base
	
	scope :complete, -> { where("completed_at is not null") }
	scope :incomplete, -> { where(completed_at: nil) }
	
	belongs_to :todo_list
	
	validates :content, presence: true, length: { minimum: 3 }
	
	def completed?
		!completed_at.blank?
	end
	
end
