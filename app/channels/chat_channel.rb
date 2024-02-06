class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def receive(data)
    Message.create!(content: data['message'])
  end
end
