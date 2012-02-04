class ActsAsViewableMigration < ActiveRecord::Migration
  def self.up
    create_table :views do |t|
      t.references :viewable, :polymorphic => true
      t.string :ip
      t.integer :ttl
      t.integer :viewable_id
      t.string :viewable_type
      t.timestamps
    end
    add_index :views, [:viewable_id, :viewable_type, :ip]
    
    create_table :total_views do |t|
      t.integer :viewable_id
      t.string :viewable_type
      t.integer :views
      t.timestamps
    end
    add_index :total_views, [:viewable_type, :viewable_id], :unique => true
  end

  def self.down
    remove_index :total_views, [:viewable_type, :viewable_id]
    drop_table :total_views
    
    remove_index :views, [:viewable_id, :viewable_type, :ip]
    drop_table :views
  end
end