class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :id
      t.string :fname
      t.string :lname
      t.date :dob

      t.timestamps
    end
  end
end
