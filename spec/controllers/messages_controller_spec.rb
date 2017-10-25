require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  # returns the minimal set of attributes required to create a valid Message
  let(:valid_attributes) {
    user = User.create!(nickname: 'nickname1')
    {content: 'message content', user_id: user.id}
  }

  let(:invalid_attributes) {
    {content: 'message content', user_id: nil}
  }

  # return the minimal set of values that should be in the session
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      message = Message.new valid_attributes
      message.user_id = valid_attributes[:user_id]
      message.save

      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message = Message.new valid_attributes
      message.user_id = valid_attributes[:user_id]
      message.save

      get :show, params: {id: message.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: {message: valid_attributes}, session: valid_session
        }.to change(Message, :count).by(1)
      end

      it "renders a JSON response with the new message" do

        post :create, params: {message: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(message_url(Message.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new message" do

        post :create, params: {message: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        user = User.create!(nickname: 'nickname1')
        {content: 'new message content', user_id: user.id}
      }

      it "updates the requested message" do
        message = Message.new valid_attributes
        message.user_id = valid_attributes[:user_id]
        message.save

        put :update, params: {id: message.to_param, message: new_attributes}, session: valid_session
        message.reload
        expect(message.content).to eq(new_attributes[:content])
      end

      it "renders a JSON response with the message" do
        message = Message.new valid_attributes
        message.user_id = valid_attributes[:user_id]
        message.save

        put :update, params: {id: message.to_param, message: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the message" do
        message = Message.new valid_attributes
        message.user_id = valid_attributes[:user_id]
        message.save

        put :update, params: {id: message.to_param, message: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested message" do
      message = Message.new valid_attributes
      message.user_id = valid_attributes[:user_id]
      message.save

      expect {
        delete :destroy, params: {id: message.to_param}, session: valid_session
      }.to change(Message, :count).by(-1)
    end
  end

end
