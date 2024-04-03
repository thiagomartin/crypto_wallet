class AddMiningTypeToCoins < ActiveRecord::Migration[7.1]
  def change
    add_reference :coins, :mining_type, null: false, foreign_key: true,  default: 1
  end
end
