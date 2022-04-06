class Scout < ApplicationRecord
  belongs_to :nurse
  belongs_to :hospital
  has_one :notification

  def create_notification_scout(recipient_user, scout, hospital)
        notification = Notification.new(
          sender: hospital.id,
          hospital_id: hospital.id,
          recipient: recipient_user.id,
          scout_id: scout.id,
          action: 2
        )
        notification.save if notification.valid?
  end
end
