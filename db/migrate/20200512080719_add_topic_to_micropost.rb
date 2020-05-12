class AddTopicToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :topic, :string
  end
end
