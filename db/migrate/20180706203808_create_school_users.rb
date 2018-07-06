class CreateSchoolUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :school_users do |t|
      t.integer :user_id
      t.integer :school_id

      t.timestamps
    end
  end
end
