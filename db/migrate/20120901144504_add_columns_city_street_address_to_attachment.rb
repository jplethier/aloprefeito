class AddColumnsCityStreetAddressToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :street, :string
    add_column :attachments, :city, :string
    add_column :attachments, :country, :string
  end
end
