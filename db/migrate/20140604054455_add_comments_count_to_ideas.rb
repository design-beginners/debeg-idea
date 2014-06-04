class AddCommentsCountToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :comments_count, :integer, default: 0

    reversible do |dir|
      dir.up do
        Idea.all.each do |idea|
          idea.update!(comments_count: idea.comments.count)
        end
      end
    end
  end
end
