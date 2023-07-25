require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to :category }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
end
