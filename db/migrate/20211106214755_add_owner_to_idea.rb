class AddOwnerToIdea < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :owner, :string
  end
end
