class CreateTask < ActiveRecord::Migration
  def change
    create_table :task do |t|
      t.string :title

      t.timestamps
    end
  end
end
