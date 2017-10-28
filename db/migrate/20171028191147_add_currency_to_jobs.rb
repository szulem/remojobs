class AddCurrencyToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :currency, :string
  end
end
