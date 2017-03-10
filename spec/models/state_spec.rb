require 'rails_helper'

RSpec.describe State, type: :model do
  it { should belong_to(:country) }

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }
end