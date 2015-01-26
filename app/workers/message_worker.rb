class MessageWorker
  include Sidekiq::Worker
  sidekiq_options queue: :message
  sidekiq_options retry: 5

  def perform sender_id, receiver_ids, message_content
    sender = User.find sender_id
    Message.transaction do
      receiver_ids.each do |recipient|
        sender.send_message recipient, message_content
      end
    end
  end
end