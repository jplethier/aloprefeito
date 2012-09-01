class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_id,       :null => false
      t.integer :complaint_id,  :null => false
      t.boolean :send_email,    :default => true
      
      t.timestamps
    end
  end
end
