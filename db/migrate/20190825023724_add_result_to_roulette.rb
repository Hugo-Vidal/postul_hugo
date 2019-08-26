class AddResultToRoulette < ActiveRecord::Migration[5.2]
  def change
    add_column :roulettes, :result, :string
  end
end
