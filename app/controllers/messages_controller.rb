class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages.includes(:room)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@message)
    else
      render :index
    end
  end

  def new
    
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end


end
