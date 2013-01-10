class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :author_id
      t.integer :publication_id

      t.timestamps
    end
    add_index :relationships, :author_id
    add_index :relationships, :publication_id
    add_index :relationships, [:author_id, :publication_id], unique: true
  end
end
