require 'rails_helper'

RSpec.describe Band, :type => :model do
  before(:all) do
    @normal_user = default_user
    @normal_user.save!
  end

  it 'should not accept a nil name' do
    expect { Band.new(name:  nil).save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should not accept a empty/blank name' do
    expect { Band.new(name: '').save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should not accept duplicate band names' do
    expect {
      bb = Band.new(name: "asdasdasdasdasdasdasdasdasdasd")
      bb.user = @normal_user
      bb.save!
    }.to_not raise_error

    expect {
      bb = Band.create!(name: "asdasdasdasdasdasdasdasdasdasd")
      bb.user = @normal_user
      bb.save!
    }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
