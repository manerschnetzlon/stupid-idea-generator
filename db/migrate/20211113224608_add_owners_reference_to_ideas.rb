class AddOwnersReferenceToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_reference :ideas, :owner, references: :users, index: true
    add_foreign_key :ideas, :users, column: :owner_id
  end
end
