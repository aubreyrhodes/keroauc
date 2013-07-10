class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.string :frequency
      t.date :start_date
      t.integer :user_id

      t.timestamps
    end
  end
end
