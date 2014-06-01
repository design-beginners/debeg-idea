FactoryGirl.define do
  factory :like_idea, class: Like do
    user
    association :likable, factory: :idea
  end
end
