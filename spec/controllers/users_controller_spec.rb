require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # return the minimal set of attributes required to create a valid User
  let(:valid_json_attributes) {
    {attributes: {nickname: 'nickname1', loggedin: true}}
  }

  let(:valid_model_attributes) {
    {nickname: 'nickname1', loggedin: true}
  }

  let(:invalid_json_attributes) {
    {attributes: {nickname: nil, loggedin: true}}
  }

  # return the minimal set of values that should be in the session
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      user = User.create! valid_model_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = User.create! valid_model_attributes
      get :show, params: {id: user.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User when the nickname doesn't exist" do
        expect {
          post :create, params: {data: valid_json_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "creates a returns the same User when the nickname does exist" do
        existing_user = User.create! valid_model_attributes

        expect {
          post :create, params: {data: valid_json_attributes}, session: valid_session
        }.to change(User, :count).by(0)

        expect(response.location).to eq(user_url(existing_user))
      end

      it "renders a JSON response with the new user" do

        post :create, params: {data: valid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/vnd.api+json')
        expect(response.location).to eq(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do

        post :create, params: {data: invalid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_json_attributes) {
        {attributes: {nickname: 'new_nickname'}}
      }

      it "updates the requested user" do
        user = User.create! valid_model_attributes
        put :update, params: {id: user.to_param, data: new_json_attributes}, session: valid_session
        user.reload
        expect(user.nickname).to eq(new_json_attributes[:attributes][:nickname])
      end

      it "renders a JSON response with the user" do
        user = User.create! valid_model_attributes

        put :update, params: {id: user.to_param, data: valid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        user = User.create! valid_model_attributes

        put :update, params: {id: user.to_param, data: invalid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_model_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end
  end

end
