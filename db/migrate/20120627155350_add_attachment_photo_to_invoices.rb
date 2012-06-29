class AddAttachmentPhotoToInvoices < ActiveRecord::Migration
  def self.up
    change_table :invoices do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :invoices, :photo
  end
end
