class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :time
      t.string :day
      t.string :location
      t.string :semester

      t.timestamps
    end
  end
end
