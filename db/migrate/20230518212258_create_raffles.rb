class CreateRaffles < ActiveRecord::Migration[7.0]
  def change
    create_table :raffles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :drawing_date
      t.integer :max_tickets
      t.boolean :private

      t.timestamps
    end
  end
end
