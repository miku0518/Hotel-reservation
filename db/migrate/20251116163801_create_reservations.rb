class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :checkin, null: false
      t.date :checkout, null: false
      t.integer :people, null: false

      t.timestamps
    end
  end
end
