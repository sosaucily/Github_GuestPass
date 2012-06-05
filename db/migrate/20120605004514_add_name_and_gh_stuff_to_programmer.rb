class AddNameAndGhStuffToProgrammer < ActiveRecord::Migration
  def change
    add_column :programmers, :fname, :string
    add_column :programmers, :lname, :string
    add_column :programmers, :ghtoken, :string
    add_column :programmers, :ghauthid, :string
  end  
end
