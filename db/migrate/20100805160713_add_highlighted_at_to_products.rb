class AddHighlightedAtToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :highlighted_at, :timestamp
  end

  def self.down
    remove_column :products, :highlighted_at
  end
end