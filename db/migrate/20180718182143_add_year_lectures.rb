class AddYearLectures < ActiveRecord::Migration[5.2]
  def change
  	add_column :lectures, :year, :string
  end
end
