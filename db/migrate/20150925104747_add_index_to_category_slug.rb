class AddIndexToCategorySlug < ActiveRecord::Migration
  def change
  	add_index :categories, :slug
  end
end
