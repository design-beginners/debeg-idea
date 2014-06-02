class IdeaOrderForm
  include ActiveModel::Model

  attr_accessor :content

  def initialize(params)
    self.content = params.try(:[], :idea_order_form).try(:[], :content).to_i
  end

  def result
    if content == 1
      join_sql = <<SQL
LEFT OUTER JOIN likes
on ideas.id = likes.likable_id
SQL
      Idea.joins(join_sql).
        where('likes.id is NULL or likes.likable_type = ?', 'Idea').
        group('ideas.id').
        order('count(likes.id) desc')
    else
      Idea.order('created_at desc')
    end
  end
end
