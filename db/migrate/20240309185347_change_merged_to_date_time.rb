class ChangeMergedToDateTime < ActiveRecord::Migration[7.1]
  def change
    change_column :pull_requests, :merged_at, :datetime
  end
end
