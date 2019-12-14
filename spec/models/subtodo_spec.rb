require 'rails_helper'

RSpec.describe Subtodo, type: :model do
  # association test
  # ensure that a subtodo record belongs to a single todo record
  it { should belong_to(:todo) }
  # validation test
  # ensure columns are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should allow_value(true).for(:completed) }  
  it { should allow_value(false).for(:completed) }
  it { should_not allow_value(nil).for(:completed) }
end
