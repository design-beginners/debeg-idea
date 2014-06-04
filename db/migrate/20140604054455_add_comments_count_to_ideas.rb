class AddCommentsCountToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :comments_count, :integer, default: 0

    reversible do |dir|
      dir.up do
        Idea.all.each do |idea|
          Idea.reset_counters(idea.id, :comments)
        end
      end
    end
  end
end
