class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.string :email

      t.timestamps
    end
  end
end
