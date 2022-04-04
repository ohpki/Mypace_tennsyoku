class Subscription < ApplicationRecord
  belongs_to :nurses, optional: true
  belongs_to :job_information
  has_one :notification

  def create_notification_subscription(myself, contents, you)
        notification = Notification.new(
          sender: myself,
          recipient: you,
          job_information_id: contents,
          action: 1
        )
        notification.save if notification.valid?
  end

end
