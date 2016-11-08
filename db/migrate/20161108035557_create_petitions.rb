class CreatePetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :petitions do |t|
      t.string :title,            null: false
      t.text :text,               null: false
      t.string :creator_name,     null: false
      t.string :creator_email,    null: false
      t.string :private_fragment, null: false, unique: true
      t.string :public_fragment,  null: false, unique: true
      t.string :callback_token,   null: false, unique: true

      t.timestamps
    end

    add_index :petitions, :private_fragment, unique: true
    add_index :petitions, :public_fragment, unique: true
    add_index :petitions, :callback_token, unique: true
  end
end
