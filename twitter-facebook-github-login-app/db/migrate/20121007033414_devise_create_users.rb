class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string  :provider, :null => false
      t.integer :uid,      :null => false
      t.string  :email
      t.string  :name

      t.timestamps
    end

    add_index :users, [:provider, :uid], :unique => true
    add_index :users, :email,            :unique => true
  end
end
