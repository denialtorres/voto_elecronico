class CreatePetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :petitions do |t|
      t.string :name
      t.text :text
      t.string :creator_name
      t.string :creator_email
      t.string :private_fragment
      t.string :public_fragment
      t.string :callback_hash

      t.timestamps
    end
  end
end
