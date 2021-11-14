class AddLikesCountToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :likes_count, :integer, default: 0, null: false
  end
end
