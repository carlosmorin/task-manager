require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :tasks }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).case_insensitive }

  it {should accept_nested_attributes_for(:tasks).allow_destroy(true)}
end
