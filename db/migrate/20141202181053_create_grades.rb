class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :child_id
      t.string :title
      t.integer :grade
      t.date :date

      t.timestamps
    end
  end
end
