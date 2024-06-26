class AddNewFieldsToUsers < ActiveRecord::Migration[7.0]

  def change
    add_column :users, :name, :string
    add_column :users, :start_date, :date
    add_column :users, :title, :string
    add_column :users, :last_promotion, :date
    add_column :users, :current_compensation, :string
    add_column :users, :review_document, :string
    add_column :users, :last_1_on_1, :date
    add_column :users, :next_1_on_1, :date
    add_column :users, :github_handle, :string
  end
end
