# -*- coding: utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    idea
    user
    sequence(:body) { |i| "コメント" }
  end
end
