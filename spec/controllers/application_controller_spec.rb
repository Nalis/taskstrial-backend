require 'rails_helper'

describe ApplicationController do
  login_user

  it "should have a current_user" do
    # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).not_to be_nil
  end
end
