require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    context 'with assign all users' do
      before do
        login_user
        subject { get :home }
      end
      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :index }
      end
  end
end

# require 'rails_helper'

# RSpec.describe Users::RegistrationsController, type: :controller do
#     before do
#       @request.env["devise.mapping"] = Devise.mappings[:user]
#       @user = attributes_for(:user)
#     end
#   describe 'POST #sign_up' do
#     subject { post :create, user: @user}
#     context "正常なデータでサインアップ" do
#       it "サインアップできる" do
#         expect {
#           subject
#         }.to change(User, :count).by(1)
#       end
#     end
#   end
# end
