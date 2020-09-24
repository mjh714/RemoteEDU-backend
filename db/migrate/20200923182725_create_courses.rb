class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :length
      t.integer :student_count
      t.integer :student_cap

      t.timestamps
    end
  end
end
