class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :nom
      t.string :prenom
      t.integer :user_id

      t.timestamps
    end
	add_index :authors, [:user_id, :created_at]
  end
end
