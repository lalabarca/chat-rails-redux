class Api::V1::MessagesController < ApplicationController
  before_action :set_channel, only: [:index, :create]

  def index
    messages = @channel.messages.order(created_at: :asc)
    render json: messages
  end

  def create
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.save
    render json: message
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
