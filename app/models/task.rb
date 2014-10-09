class Task < ActiveRecord::Base
  attr_accessible :title, :description, :completed
  
  validates :title, presence: true, length: { in: 3..254 }
  validates :description, presence: true, length: { in: 3..254}
  validates :completed, presence: true
end
