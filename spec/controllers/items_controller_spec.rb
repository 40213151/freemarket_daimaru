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

      it 'renders index' do
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

  describe 'GET #show' do
    context 'log in' do
      before do
        login user
        get :index
      end
      it "renders the :show template" do
        item = create(:item)
        get :show, params: { id: item.id }
        expect(response).to render_template :show
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

  describe '' do
  end
end
