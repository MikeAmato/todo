class AddCompletedToTaskDrop < ActiveRecord::Migration
  def change
    add_column :task, :completed, :boolean, default: false
  end
end
