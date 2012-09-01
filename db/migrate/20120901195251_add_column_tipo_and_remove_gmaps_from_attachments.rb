class AddColumnTipoAndRemoveGmapsFromAttachments < ActiveRecord::Migration
  def up
    add_column :attachments, :type, :integer
    remove_column :attachments, :gmaps
  end

  def down
    add_column :attachments, :gmaps, :boolean, :default => true
    remove_column :attachments, :type
  end
end
