require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    context "when user is signed in" do
      login_user
      
      before(:each) do
        get :show
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders :show template" do
        expect(response).to render_template(:show)
      end

      it 'assign the current_user' do
        expect(assigns(:user)).to eq subject.current_user
      end
    end

    context "when user isn't signed in" do
      before(:each) do
        get :show
      end

      it 'returns http redirect' do
        expect(response.status).to eq(302)
      end

      it 'does not render a template' do
        expect(response).not_to render_template(:show)
      end
    end
  end

end
