require 'rails_helper'

RSpec.describe JsonWebToken do
  subject { described_class } 
  let(:user) { create :user, password: "123213123"}
  let(:token) { token_generator(user.id) }

  describe ".encode" do
    it "returns valid token" do
      encoded = subject.encode(user_id: user.id)
      expect(encoded.length).to eq(107)
    end
  end

  describe ".decode" do
    it "returns payload content" do
      decoded = subject.decode(token)
      expect(decoded[:user_id]).to eq(user.id)
    end
  end
end