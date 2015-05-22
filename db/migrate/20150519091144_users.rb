class Users < ActiveRecord::Migration
  def up
  	create_table :users do |t|
  		t.string :wechatopenid
  		t.string :nickname
  		t.string :headimgurl
  		t.string :city
  		t.string :province
  		t.string :country
  		t.boolean :isAnalyst, :default => false
  	end
  end

  def down
  	drop_table :users
  end
end
