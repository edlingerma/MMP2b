# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.integer :goal
      t.string :unit
      t.references :challenge

      t.timestamps
    end
  end
end
