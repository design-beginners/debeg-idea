require 'spec_helper'

describe Comment do
  it { should belong_to(:idea) }
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_most(1000) }
end
