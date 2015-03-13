require 'spec_helper'

RSpec.describe TodoItem, type: :model do
  it { should belong_to(:todo_list) }
end
