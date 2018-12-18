require 'rails_helper'
describe ItemsController do
  let(:image) { create(:image) }
  let(:user) { create(:user) }
  describe '#index' do
    context 'log in' do
      before do
        login user
        get :index
      end

      it 'redners index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end