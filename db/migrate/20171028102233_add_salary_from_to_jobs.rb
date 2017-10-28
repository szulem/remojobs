class AddSalaryFromToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :salary_from, :integer
  end
end
