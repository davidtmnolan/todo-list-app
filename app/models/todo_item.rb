class TodoItem < ActiveRecord::Base
	belongs_to :todo_list

	validates :content, presence: true, length: { minimum: 3 }
	
	scope :pending,   -> { where('completed_at is null') }
	scope :completed, -> { where('completed_at is not null') }

	def completed?
		completed_at?
	end

  def complete!
    update_attribute :completed_at, Time.now.utc
  end

  def uncomplete!
    update_attribute :completed_at, nil
  end
end
