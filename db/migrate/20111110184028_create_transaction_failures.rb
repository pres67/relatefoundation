class CreateTransactionFailures < ActiveRecord::Migration
  def self.up
    create_table :transaction_failures do |t|
      t.integer :id
      t.string :status
      t.string :result_dump
      t.string :result_params_dump

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_failures
  end
end
