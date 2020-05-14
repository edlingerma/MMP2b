# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.references :owner, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
