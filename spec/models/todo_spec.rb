require 'rails_helper'

RSpec.describe Todo, type: :model do
  # association test
  # ensure Todo model has a 1:m relationship with the Subtodo model
  it { should have_many(:subtodos).dependent(:destroy) }
  # validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should allow_value(true).for(:completed) }  
  it { should allow_value(false).for(:completed) }
  it { should_not allow_value(nil).for(:completed) }
end
