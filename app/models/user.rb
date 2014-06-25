class User < ActiveRecord::Base
	has_secure_password
	
	has_many :todo_lists
	
	validates :email, presence: true, 
										uniqueness: true,
										format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/ }
										
end
