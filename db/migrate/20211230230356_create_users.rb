class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
			t.string :email, index: true
      t.string :fingerprint, index: true
      t.string :appleID, index: true
      t.string :subscription, index: true
      t.string :session_token
      t.timestamps
    end
  end
end
