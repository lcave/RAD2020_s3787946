class AddTopicToMicroposts < ActiveRecord::Migration[5.1]
  def change
    remove_column :microposts, :topic, :string
    add_column :microposts, :topic, :string, default: "News"
  end
end
