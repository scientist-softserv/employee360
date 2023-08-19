class CreateSalaryHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :salary_histories do |t|
      t.string :job_title
      t.string :salary
      t.date :change_date
      t.string :change_reason
      t.boolean :current_salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
