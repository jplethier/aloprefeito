class CreateTableAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.date :attachment_updated_at
      t.float :latitude
      t.float :longitude
      t.integer :complaint_id, :null => false
      t.boolean :gmaps, :default => true

      t.timestamps
    end
  end
end
