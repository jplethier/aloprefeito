class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name
      t.string :email
      t.string :provider,   :null => false
      t.string :uid,        :null => false
      t.string :fb_token

      t.timestamps
    end
  end
end
