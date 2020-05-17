class AddCommentsToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :comment_count, :int, default: 0
  end
end
