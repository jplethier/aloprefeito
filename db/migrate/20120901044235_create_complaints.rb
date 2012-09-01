class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :description, :null => false
      t.boolean :anonymous, :null => false, :default => false
      t.boolean :resolved, :null => false, :default => false
      t.integer :user_id
      
      t.timestamps
    end
  end
end
