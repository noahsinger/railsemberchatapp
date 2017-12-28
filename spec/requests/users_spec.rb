require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "responds with JSON" do
      user = User.create! nickname: 'nickname1'

      get users_path

      # expect the result to be json
      expect(response.content_type).to eq('application/vnd.api+json')
    end
  end
end
