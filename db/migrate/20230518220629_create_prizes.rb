class CreatePrizes < ActiveRecord::Migration[7.0]
  def change
    create_table :prizes do |t|
      t.belongs_to :raffle, null: false, foreign_key: true
      t.string :name
      t.integer :place

      t.timestamps
    end
  end
end
