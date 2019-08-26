class CreateRoulettes < ActiveRecord::Migration[5.2]
  def change
    create_table :roulettes do |t|
      t.string :name
      t.integer :money
      t.string :bet
      t.integer :wager
      t.integer :game

      t.timestamps
    end
  end
end
