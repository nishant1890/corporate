class AddNutritionistToUtilityExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :utility_expenses, :nutritionist, :integer, default: 0
  end
end
