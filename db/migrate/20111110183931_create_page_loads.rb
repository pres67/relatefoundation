class CreatePageLoads < ActiveRecord::Migration
  def self.up
    create_table :page_loads do |t|
      t.integer :id
      t.string :url
      t.datetime :create_at

      t.timestamps
    end
  end

  def self.down
    drop_table :page_loads
  end
end
