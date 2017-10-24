require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /messages" do
    it "responds with JSON" do
      user = User.create! nickname: 'nickname1'
      message = user.messages.build(content: 'test message').save

      get messages_path
      expect(response.content_type).to eq('application/json')
    end
  end
end
