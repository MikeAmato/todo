class AddDescriptionToTask < ActiveRecord::Migration
  def change
    add_column :task, :description, :string
  end
end
