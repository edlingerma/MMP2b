class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user
      t.references :challenge
      t.boolean :confirmed
      t.references :owner, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
