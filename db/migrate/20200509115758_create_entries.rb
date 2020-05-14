# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :amount
      t.references :activity
      t.references :user

      t.timestamps
    end
  end
end
