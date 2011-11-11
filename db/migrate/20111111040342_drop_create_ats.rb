class DropCreateAts < ActiveRecord::Migration
  def self.up
    remove_column :page_loads, :create_at
    remove_column :transactions, :create_at
  end

  def self.down
    add_column :transactions, :create_at, :datetime
    add_column :page_loads, :create_at, :datetime
  end
end
