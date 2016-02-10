class AddPictureToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :picture_id, :string
  end
end
