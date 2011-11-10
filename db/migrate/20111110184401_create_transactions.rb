class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :id
      t.integer :transaction_id
      t.string :type
      t.integer :amount
      t.string :status
      t.datetime :braintree_created_at
      t.datetime :braintree_updated_at
      t.string :token
      t.string :bin
      t.integer :last_4
      t.string :card_type
      t.datetime :expiration_date
      t.string :cardholder_name
      t.string :customer_location
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :masked_number
      t.datetime :create_at
      t.string :callb
      t.string :user_id
      t.string :custom_fields_dump
      t.string :transaction_dump

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
