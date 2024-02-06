class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path, notice: 'Message was successfully sent.' }
        format.json { render :show, status: :created, location: @message }
        ActionCable.server.broadcast('chat_channel', @message.content)
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def message_params
      params.require(:message).permit(:content)
    end
end
