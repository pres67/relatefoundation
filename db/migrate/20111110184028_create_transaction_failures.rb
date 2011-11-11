class CreateTransactionFailures < ActiveRecord::Migration
  def self.up
    create_table :transaction_failures do |t|
      t.integer :id
      t.string :status
      t.text :result_dump
      t.text :result_params_dump

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_failures
  end
end
