class CreatePullRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :pull_requests do |t|
      t.integer :num
      t.string :url
      t.string :title
      t.string :repository
      t.text :notes
      t.references :category, null: false, foreign_key: true
      t.time :merged_at

      t.timestamps
    end
    add_index :pull_requests, :url, unique: true
  end
end
