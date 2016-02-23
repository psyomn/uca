require 'rails_helper'

RSpec.describe StaticPageController, :type => :controller do
  describe "GET home" do
    it 'should have a homepage' do
      get :home
    end
  end

  describe 'GET about' do
    it 'should have an about page' do
      get :about
    end
  end
end
