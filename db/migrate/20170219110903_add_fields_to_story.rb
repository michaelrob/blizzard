class AddFieldsToStory < ActiveRecord::Migration
  def change
    add_reference :stories, :assigned, references: :users, index: true
    add_foreign_key :stories, :users, column: :assigned_id
  end
end
