class CreateStockMessages < ActiveRecord::Migration
  def change
    create_table :stock_messages do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
