class AddIndexToUniversitySlug < ActiveRecord::Migration
  def change
  	add_index :universities, :slug
  end
end
