class Api::V1::MessagesController < ApplicationController
  before_action :set_channel, only: [:index, :create]

  def index
    @messages = @channel.messages.order(created_at: :asc)
    render json: @messages.as_json
  end

  def create
  end

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
