class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
	validates :content, presence: true, length: { minimum: 3 }
	
	scope :complete, -> { where("completed_at is not null") }
	
	def completed?
		!completed_at.blank?
	end
	
end
