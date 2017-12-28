class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def unsubscribed
    # no cleanup needed when channel is unsubscribed for now
  end
end
