class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :raffle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
