class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.string :original_url
      t.string :path
      t.text :description
      t.integer :download_count

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
