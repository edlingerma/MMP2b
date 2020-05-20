# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

require 'rails_helper'

RSpec.describe RequestsController, type: :request do
  fixtures :requests, :challenges

  describe "Requests" do
    it "accept" do
      get accept_request_path(requests(:one))
      should redirect_to show_owner_challenge_path(challenges(:one))
    end

    it "reject" do
      get reject_request_path(requests(:one))
      should redirect_to show_owner_challenge_path(challenges(:one))
    end
  end
end
