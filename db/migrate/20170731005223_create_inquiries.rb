class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.date :checkin
      t.date :checkout
      t.decimal :total

      t.timestamps
    end
  end
end
