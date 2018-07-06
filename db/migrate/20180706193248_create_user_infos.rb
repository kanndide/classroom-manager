class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.integer :user_id

      t.timestamps
    end
  end
end
