class RenameNumToNumber < ActiveRecord::Migration[7.1]
  def change
    rename_column :pull_requests, :num, :number
  end
end
