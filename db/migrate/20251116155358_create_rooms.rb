class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :hotelname, null: false, default: ""
      t.text :hotelintoroduction, null: false, default: ""
      t.integer :price, null: false
      t.string :adress, null: false, default: ""

      t.timestamps
    end
  end
end
