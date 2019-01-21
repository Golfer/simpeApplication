require 'rails_helper'

describe MessagesController, type: :request do
  let(:user) { create(:user) }
  let(:admin_user) { create(:user, is_admin: true) }
  describe '#index' do
    let!(:messages) { create_list(:message, 3) }
    context 'guest user' do
      before(:each) do
        get messages_path
      end
      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template :index }
      it { expect(assigns(:messages).count).to eq 3 }
    end

    context 'User authorized'
    context 'User with Admin access'
  end


end
