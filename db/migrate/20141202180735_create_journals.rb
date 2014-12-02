class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :child_id
      t.string :day
      t.string :subject
      t.text :memo
      t.date :date

      t.timestamps
    end
  end
end
