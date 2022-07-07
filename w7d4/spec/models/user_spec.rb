# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  cheer           :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do

  describe "presence" do
    before :each do
      create(:user)
    end
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_presence_of(:cheer)}
    # it {should validate_length_of(:cheer).to_equal (12)}
  end


  describe "uniqueness" do 
    before :each do
      create(:user)
    end

    it {should validate_uniqueness_of(:session_token)}
  end
end
