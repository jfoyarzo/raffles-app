class CreateWinners < ActiveRecord::Migration[7.0]
  def change
    create_table :winners do |t|
      t.belongs_to :raffle, null: false, foreign_key: true
      t.belongs_to :participant, null: false, foreign_key: true
      t.belongs_to :prize, null: false, foreign_key: true
      t.integer :place
      t.datetime :drawing_date

      t.timestamps
    end
  end
end
