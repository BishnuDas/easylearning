class AddIndexToTutorialSlug < ActiveRecord::Migration
  def change
  	add_index :tutorials, :slug
  end
end
