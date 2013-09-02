require 'spec_helper'

describe ApiKey do
  it "generates access token" do
    api_key = create(:session_api_key)
    api_key.new_record?.should eq false
    api_key.access_token.should =~ /\S{32}/
  end

  it "sets the expired_at properly for 'session' scope" do
    Time.stub(:now).and_return(Time.at(0))
    api_key = create(:session_api_key)

    api_key.expired_at.should eq 1.hours.from_now
  end

  it "sets the expired_at properly for 'cookie' scope" do
    Time.stub(:now).and_return(Time.at(0))
    api_key = create(:cookie_api_key)

    api_key.expired_at.should eq 14.days.from_now
  end
end

