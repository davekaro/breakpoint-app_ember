class ApiKey < ActiveRecord::Base
  validates :scope, inclusion: { in: %w( session cookie ) }
  before_create :generate_access_token, :set_expiry_date
  belongs_to :user

  def self.session
    where(scope: 'session')
  end

  def self.cookie
    where(scope: 'cookie')
  end

  def self.active
    where("expired_at >= ?", Time.now)
  end

  def expire!
    update_attributes(expired_at: Time.now)
  end

  private

  def set_expiry_date
    if self.scope == 'session'
      self.expired_at = 1.hours.from_now
    elsif self.scope == 'cookie'
      self.expired_at = 14.days.from_now
    end
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end

