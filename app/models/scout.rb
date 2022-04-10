class Scout < ApplicationRecord
  belongs_to :nurse
  belongs_to :hospital
  has_one :notification, dependent: :destroy

  def create_notification_scout(hospital, nurse, scout)
        notification = Notification.new(
          sender: hospital.id,
          recipient: nurse.id,
          scout_id: scout.id,
          user_type: true,
          action: 2
        )
        notification.save if notification.valid?
  end
end
