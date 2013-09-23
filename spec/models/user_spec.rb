require 'spec_helper'

describe User do
  it "sets up session api key correctly" do
    user = create(:user)
    api_key = user.generate_api_key
    expect(api_key.access_token).to match(/\S{32}/)
    expect(api_key.user_id).to eq user.id
    expect(api_key.scope).to eq 'session'
  end

  it "sets up cookie api key correctly" do
    user = create(:user)
    api_key = user.generate_api_key(true)
    expect(api_key.access_token).to match(/\S{32}/)
    expect(api_key.user_id).to eq user.id
    expect(api_key.scope).to eq 'cookie'
  end

  it 'returns name when first and last exist' do
    user = build(:user, :first_name => 'DK', :last_name => 'Row')
    expect(user.name).to eq 'DK Row'
  end

  it 'returns first name when last is empty' do
    user = build(:user, :first_name => 'DK', :last_name => '')
    expect(user.name).to eq 'DK'
  end

  it 'returns last name when first is empty' do
    user = build(:user, :first_name => '', :last_name => 'Row')
    expect(user.name).to eq 'Row'
  end

  it 'validation fails if first and last name are empty' do
    user = build(:user, :first_name => '', :last_name => '', :email => 'dkrow@example.com')
    expect(user.valid?).to be_false
    expect(user.errors.full_messages).to eq ['Please fill in first name or last name, preferably both.']
  end

  it 'nils work too' do
    user = build(:user, :first_name => 'dkrow', :last_name => nil, :email => 'dkrow@example.com')
    expect(user.name).to eq 'dkrow'
  end
end

