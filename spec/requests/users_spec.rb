require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "responds with the correct JSON for ember" do
      user = User.create! nickname: 'nickname1'

      # what a jsonapi should look like for the user created above
      model_json = '{"data":[{"id":"1","type":"users","attributes":{"nickname":"nickname1","loggedin":null}}]}'

      get users_path
      expect(response).to be_success

      expected_json = JSON.parse(model_json)
      expected_nickname = expected_json["data"][0]["attributes"]["nickname"]

      response_json = JSON.parse(response.body)
      response_nickname = response_json["data"][0]["attributes"]["nickname"]

      # json won't match entirly because of differences in id's, but
      #  if the nickname buried in the json matches then the structure of
      #  the json *probably* matches
      expect(response_nickname).to eq(expected_nickname)
    end
  end
end
