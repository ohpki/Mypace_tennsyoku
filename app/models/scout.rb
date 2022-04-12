class Scout < ApplicationRecord
  belongs_to :nurse
  belongs_to :hospital
  has_one :notification, dependent: :destroy

  def create_notification_scout(hospital, nurse, scout)
        notification = Notification.new(
          hospital_id: hospital.id,
          nurse_id: nurse.id,
          scout_id: scout.id,
          user_type: true,
          action: 2
        )
        notification.save if notification.valid?
  end
end
