require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'should reject duplicate users' do
    user1 = default_user
    user2 = default_user
    expect{user1.save!}.to_not raise_error
    expect{user2.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
