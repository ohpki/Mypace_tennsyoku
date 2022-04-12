class Subscription < ApplicationRecord
  belongs_to :nurses, optional: true
  belongs_to :job_information
  belongs_to :notification, dependent: :destroy, optional: true


  def create_notification_subscription(nurse, hospital, job_information)
        notification = Notification.new(
          nurse_id: nurse,
          hospital_id: hospital,
          user_type: false,
          job_information_id: job_information,
          action: 1
        )
        notification.save if notification.valid?
  end

end
