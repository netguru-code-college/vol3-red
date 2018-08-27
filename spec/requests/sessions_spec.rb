require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  it "signs user in and out" do
    user = User.where(email: 'user@example.org').take
    if user
      user.destroy
    end

    user = User.create!(email: "user@example.org", password: "very-secret")
    user.confirm
    
    sign_in user
    get '/dashboard'
    expect(controller.current_user).to eq(user)
    
    sign_out user
    get '/'
    expect(controller.current_user).to be_nil
  end

end
