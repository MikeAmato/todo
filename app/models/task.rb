class Task < ActiveRecord::Base
  attr_accessible :title
  validates :title, presence: true, length: { in: 3..254 }
end
