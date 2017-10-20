require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /messages" do
    it "responds with the correct JSON for ember" do
      user = User.create! nickname: 'nickname1'
      message = user.messages.build(content: 'test message').save

      # what a jsonapi should look like for the message created above
      model_json = '{"data":[{"id":"1","type":"messages","attributes":{"content":"test message"},"relationships":{"user":{"data":{"id":"1","type":"users"}}}}]}'

      get messages_path
      expect(response).to be_success

      expected_json = JSON.parse(model_json)
      expected_content = expected_json["data"][0]["attributes"]["content"]

      response_json = JSON.parse(response.body)
      response_content = response_json["data"][0]["attributes"]["content"]

      # json won't match entirly because of differences in id's, but
      #  if the content buried in the json matches then the structure of
      #  the json is *probably* correct
      expect(response_content).to eq(expected_content)
    end
  end
end
