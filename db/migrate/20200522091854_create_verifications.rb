class CreateVerifications < ActiveRecord::Migration[5.1]
  def change
    create_table :verifications do |t|
      t.string :name
      t.string :number
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
