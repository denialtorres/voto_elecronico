class CreateSigners < ActiveRecord::Migration[5.0]
  def change
    create_table :signers do |t|
      t.references :petition, index: true, null: false
      t.string :name,           null: false
      t.string :email,          null: false
      t.string :last_name,      null: false
      t.string :second_name,    null: false
      t.string :tax_id,         null: false
      t.string :certificate_number
      t.string :ce,             null: false
      t.string :ocr,            null: false
      t.string :ne,             null: false
      t.string :signature
      t.timestamp :signed_at
      t.string :tiwtter

      t.timestamps
    end

    add_index :signers, [:certificate_number, :petition_id], unique: true
    add_index :signers, [:tax_id, :petition_id, :signed_at], unique: true
  end
end
