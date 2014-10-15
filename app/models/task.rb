class Task < ActiveRecord::Base
  attr_accessible :title, :description, :completed, :due_at
  
  validates :title, presence: true, length: { in: 3..254 }
  validates :description, presence: true, length: { in: 3..254}
  validates :completed, presence: true
  validates :due_at, presence: true

before_save :set_due_at

  def set_due_at 
    self.due_at ||= Date.today
  end
end
