class User < ActiveRecord::Base
  has_secure_password

  has_many :api_keys

  validates :email,     presence: true, uniqueness: true
  validates :time_zone, inclusion: { in: ActiveSupport::TimeZone.zones_map(&:name) }
  validate :first_name_or_last_name_present

  def first_name_or_last_name_present
    if first_name.blank? && last_name.blank?
      errors.add(:base, 'Please fill in first name or last name, preferably both.')
    end
  end

  def name
    if first_name.present? && last_name.present?
      "#{first_name} #{last_name}"
    elsif first_name.blank? && last_name.present?
      "#{last_name}"
    elsif first_name.present? && last_name.blank?
      "#{first_name}"
    end
  end

  def session_api_key
    api_keys.active.session.first_or_create
  end
end

