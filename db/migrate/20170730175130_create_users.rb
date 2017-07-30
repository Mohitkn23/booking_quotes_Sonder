class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.references :unit, foreign_key: true
      t.date :checkin
      t.date :checkout

      t.timestamps
    end
  end
end
