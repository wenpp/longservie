class StockDatas < ActiveRecord::Migration
  def up
    create_table :stockdatas do |t|
      t.string :stocknumber
      t.string :stockname

      t.timestamps
    end

    add_index :stockdatas, [:stockname, :stocknumber], unique: true
  end

  def down
  	drop_table :stockdatas
  end
end
