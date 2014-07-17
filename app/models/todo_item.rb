class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true, length: { minimum: 3 }

  scope :pending,   -> { where('completed_at is null') }
  scope :completed, -> { where('completed_at is not null') }

  after_save :notify_todo_list
  after_destroy :notify_todo_list

  def completed?
    completed_at?
  end

  def complete!
    update_attribute :completed_at, Time.now.utc
  end

  def uncomplete!
    update_attribute :completed_at, nil
  end
  
  private
    def notify_todo_list
      todo_list.mark_as_completed_if_all_items_are_completed
    end
end