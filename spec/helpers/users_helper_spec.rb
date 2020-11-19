require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  describe 'sign_in' do
    before 'soemthing' do
      a = User.new(username: 'ok', password: 'oesa')
      a.save
    end
    it 'returns current session' do
      expect(current_user(1)).to be_an_instance_of(User)
    end
  end
end
