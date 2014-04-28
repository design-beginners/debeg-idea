require 'spec_helper'

describe Idea do
  it { should have_many(:comments) }
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(100) }
  it { should belong_to(:user) }
end
