FactoryGirl.define do
  factory :api_key do
    user

    factory :session_api_key do
      access_token SecureRandom.hex
      scope        'session'
      expired_at   4.hours.from_now
    end

    factory :api_api_key do
      access_token SecureRandom.hex
      scope        'api'
      expired_at   4.hours.from_now
    end
  end
end

