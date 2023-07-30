class AddDueDateToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :due_date, :date
  end
end
