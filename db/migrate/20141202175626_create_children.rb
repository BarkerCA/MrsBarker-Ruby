class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :fname
      t.string :lname
      t.date :dob

      t.timestamps
    end
  end
end
