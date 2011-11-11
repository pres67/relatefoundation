class ChangeType < ActiveRecord::Migration
  def self.up
    change_column :transactions, :transaction_dump, :text
    change_column :transactions, :transaction_dump, :text
    change_column :transaction_failures, :result_dump, :text
    change_column :transaction_failures, :result_params_dump, :text
  end

  def self.down
    
  end
end
