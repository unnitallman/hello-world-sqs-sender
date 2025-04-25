class User < ApplicationRecord
  before_create :generate_guid

  def sync_data
    SnsSender.publish(message: {
      type: "user_sync",
      data: {
        guid: guid,
        name: name,
        email: email,
        age: age
      }
    })
  end

  private

  def generate_guid
    self.guid = SecureRandom.uuid
  end
end
