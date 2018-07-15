class AddSchoolIdColumnLecture < ActiveRecord::Migration[5.2]
  def change
  	add_column :lectures, :school_id, :integer
  end
end
