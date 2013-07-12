class AddRecurrenceIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :recurrence_id, :integer
  end
end
