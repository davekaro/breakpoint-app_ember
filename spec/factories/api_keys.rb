FactoryGirl.define do
  factory :api_key do
    user

    factory :session_api_key do
      access_token SecureRandom.hex
      scope        'session'
      expired_at   4.hours.from_now
    end

    factory :cookie_api_key do
      access_token SecureRandom.hex
      scope        'cookie'
      expired_at   14.days.from_now
    end
  end
end

