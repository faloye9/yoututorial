class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :pw_digest
      t.string :image

      t.timestamps null: false
    end
  end
end
