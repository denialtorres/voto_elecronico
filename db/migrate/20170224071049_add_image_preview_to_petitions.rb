class AddImagePreviewToPetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :petitions, :image_preview, :integer
  end
end
