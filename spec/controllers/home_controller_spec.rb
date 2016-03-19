require 'rails_helper'

describe HomeController, type: :controller do
  describe "GET root path" do
    it "renders the :index template", focus: true do
      expect(get: root_url).to route_to(controller: "home", action: "index")
    end
  end
end
