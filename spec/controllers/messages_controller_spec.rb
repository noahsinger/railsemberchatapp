require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  # returns the minimal set of attributes required to create a valid Message
  let(:valid_json_attributes) {
    user = User.create!(nickname: 'nickname1')
    {attributes: {content: 'message content', user_id: user.id}}
  }

  let(:valid_model_attributes) {
    user = User.create!(nickname: 'nickname1')
    {content: 'message content', user_id: user.id}
  }

  let(:invalid_json_attributes) {
    {attributes: {content: 'message content', user_id: nil}}
  }

  # return the minimal set of values that should be in the session
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      message = Message.new valid_model_attributes
      message.user_id = valid_model_attributes[:user_id]
      message.save

      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message = Message.new valid_model_attributes
      message.user_id = valid_model_attributes[:user_id]
      message.save

      get :show, params: {id: message.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: {data: valid_json_attributes}, session: valid_session
        }.to change(Message, :count).by(1)
      end

      it "renders a JSON response with the new message" do

        post :create, params: {data: valid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/vnd.api+json')
        expect(response.location).to eq(message_url(Message.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new message" do

        post :create, params: {data: invalid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_json_attributes) {
        user = User.create!(nickname: 'nickname1')
        {attributes: {content: 'new message content', user_id: user.id}}
      }

      it "updates the requested message" do
        message = Message.new valid_model_attributes
        message.user_id = valid_model_attributes[:user_id]
        message.save

        put :update, params: {id: message.to_param, data: new_json_attributes}, session: valid_session
        message.reload
        expect(message.content).to eq(new_json_attributes[:attributes][:content])
      end

      it "renders a JSON response with the message" do
        message = Message.new valid_model_attributes
        message.user_id = valid_model_attributes[:user_id]
        message.save

        put :update, params: {id: message.to_param, data: valid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the message" do
        message = Message.new valid_model_attributes
        message.user_id = valid_model_attributes[:user_id]
        message.save

        put :update, params: {id: message.to_param, data: invalid_json_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested message" do
      message = Message.new valid_model_attributes
      message.user_id = valid_model_attributes[:user_id]
      message.save

      expect {
        delete :destroy, params: {id: message.to_param}, session: valid_session
      }.to change(Message, :count).by(-1)
    end
  end

end
