class RenameColumnAttachmentType < ActiveRecord::Migration
  def up
    remove_column :attachments, :type
    add_column :attachments, :attachment_type, :integer
  end

  def down
    remove_column :attachments, :attachment_type
    add_column :attachments, :type, :integer
  end
end
