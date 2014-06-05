class TodoList < ActiveRecord::Base
  validates :title, presence: true
  validates :title, :description, length: {minimum: 3} 
end
