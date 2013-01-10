class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :titre
      t.string :type
      t.string :nom
      t.string :annee
      t.string :mois
      t.string :pages
      t.string :notes
      t.string :resume

      t.timestamps
    end
  end
end
