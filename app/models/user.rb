class User < ActiveRecord::Base
  has_many :messages, class_name: Message.name, foreign_key: :sender_id
  scope :sendable_users, ->(user_id){where.not id: user_id}

  def send_message receiver_id, content
    self.messages.create receiver_id: receiver_id, content: content
  end
end
