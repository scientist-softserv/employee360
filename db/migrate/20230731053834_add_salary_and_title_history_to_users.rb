class AddSalaryAndTitleHistoryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :title_history, :string, array: true, default: []
    add_column :users, :compensation_history, :string, array: true, default: []
    add_column :users, :title_or_compensation_change_date, :string, array: true, default: []
    add_column :users, :title_or_compensation_change_reason, :string, array: true, default: []
  end
end
