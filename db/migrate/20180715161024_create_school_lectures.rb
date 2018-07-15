class CreateSchoolLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :school_lectures do |t|
    	t.integer :school_id
    	t.integer :lecture_id
    end
  end
end
