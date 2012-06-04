class CreateProgrammers < ActiveRecord::Migration
  def change
    create_table :programmers do |t|
      t.string :email

      t.timestamps
    end
  end
end
