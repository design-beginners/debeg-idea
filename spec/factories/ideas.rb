# -*- coding: utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    user
    sequence(:title) { |i| "アイデア#{i}" }
  end
end
