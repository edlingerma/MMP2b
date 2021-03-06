# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class AddOAuthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :token, :string
    add_column :users, :secret, :string
  end
end
