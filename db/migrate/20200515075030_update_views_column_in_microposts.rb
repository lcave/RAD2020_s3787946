class UpdateViewsColumnInMicroposts < ActiveRecord::Migration[5.1]
  def change
    remove_column :microposts, :views, :int
    add_column :microposts, :views, :integer, default: 0
  end
end
