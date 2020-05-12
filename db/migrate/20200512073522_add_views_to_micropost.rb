class AddViewsToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :views, :int
  end
end
