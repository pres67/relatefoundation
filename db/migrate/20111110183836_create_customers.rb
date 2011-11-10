class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.integer :id
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
