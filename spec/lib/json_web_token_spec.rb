require 'rails_helper'

RSpec.describe JsonWebToken do
  subject { described_class } 
  let(:user) { create :user, password: "123213123"}
  let(:token) { token_generator(user.id) }

  describe ".decode" do
    it "returns payload content" do
      decoded = subject.decode(token)
      expect(decoded[:user_id]).to eq(user.id)
    end
  end
end