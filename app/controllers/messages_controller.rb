class MessagesController < ApplicationController
  def create
    MessageWorker.perform_in params[:period].to_i.minute, params[:sender_id], params[:receiver_ids], params[:message_content]
    redirect_to User.find(params[:sender_id])
  end
end