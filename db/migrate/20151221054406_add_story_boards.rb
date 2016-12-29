class AddStoryBoards < ActiveRecord::Migration
  def change
    create_table :story_boards do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps null: false
    end

    add_column :story_groups, :story_board_id, :integer
    add_foreign_key :story_groups, :story_boards, column: :story_board_id
  end
end
