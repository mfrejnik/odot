require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  it { should belongs_to(:todo_list) }
end
