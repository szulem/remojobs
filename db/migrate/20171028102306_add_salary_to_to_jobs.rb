class AddSalaryToToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :salary_to, :integer
  end
end
