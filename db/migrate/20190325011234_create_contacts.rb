class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :business
      t.text :reason
      t.text :other
      
      t.timestamps
    end
  end
end
