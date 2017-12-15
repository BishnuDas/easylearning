class AddIndexToSubjectSlug < ActiveRecord::Migration
  def change
  	add_index :subjects, :slug
  end
end
