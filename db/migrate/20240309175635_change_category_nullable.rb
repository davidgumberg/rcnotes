class ChangeCategoryNullable < ActiveRecord::Migration[7.1]
  def change
    change_column :pull_requests, :category_id, :integer, null: true
  end
end
