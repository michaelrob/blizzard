class AddStoriesStoryBoardRelationship < ActiveRecord::Migration
  def change
    add_column :stories, :story_group_id, :integer
    add_foreign_key :stories, :story_groups, column: :story_group_id
  end
end
