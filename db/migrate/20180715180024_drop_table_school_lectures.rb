class DropTableSchoolLectures < ActiveRecord::Migration[5.2]
  def change
  	drop_table :school_lectures
  end
end
