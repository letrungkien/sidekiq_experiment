class Message < ActiveRecord::Base
  belongs_to :sender, class_name: User.name, foreign_key: :sender_id
end
