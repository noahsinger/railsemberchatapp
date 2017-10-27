class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.all
    render jsonapi: @messages, include: [:user]
  end

  # GET /messages/1
  def show
    render jsonapi: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      render jsonapi: @message, status: :created, location: @message
    else
      render jsonapi_errors: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render jsonapi: @message
    else
      render jsonapi_errors: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:data).require(:attributes).permit(:content, :user_id)
    end
end
