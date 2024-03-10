class AddTestPriorityToPullRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :pull_requests, :test_priority, :integer, default: 0
    add_index :pull_requests, :test_priority
  end
end
