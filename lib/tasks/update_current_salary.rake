namespace :salary_histories do
  desc "Update current salary based on most recent salary history"
  task :update_current_salary => :environment do
    User.find_each do |user|
      salary_histories = user.salary_histories.order(change_date: :desc)
      most_recent_salary_history = salary_histories.first

      if most_recent_salary_history
        most_recent_salary_history.update(current_salary: true)
        user.salary_histories.where.not(id: most_recent_salary_history.id).update_all(current_salary: false)
      end
    end
  end
end
