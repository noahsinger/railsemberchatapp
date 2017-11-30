class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users"
  end

  def unsubscribed
    # no cleanup needed when channel is unsubscribed from for now
  end
end
