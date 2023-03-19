require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/words/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /upload" do
    it "returns http success" do
      get "/words/upload"
      expect(response).to have_http_status(:success)
    end
  end

end
