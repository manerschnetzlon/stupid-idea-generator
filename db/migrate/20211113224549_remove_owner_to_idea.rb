class RemoveOwnerToIdea < ActiveRecord::Migration[6.1]
  def change
    remove_column :ideas, :owner
  end
end
