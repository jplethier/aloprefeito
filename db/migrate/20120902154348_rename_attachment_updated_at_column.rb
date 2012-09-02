class RenameAttachmentUpdatedAtColumn < ActiveRecord::Migration
  def up
    remove_column :attachments, :attachment_updated_at
    add_column :attachments, :attachment_updated_at, :datetime
  end

  def down
    remove_column :attachments, :attachment_updated_at
    add_column :attachments, :attachment_updated_at, :date
  end
end
