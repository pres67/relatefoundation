class CreateCallbacks < ActiveRecord::Migration
  def self.up
    create_table :callbacks do |t|
      t.integer :id
      t.string :url
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :callbacks
  end
end
