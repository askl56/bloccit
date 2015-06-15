require 'rails_helper'

describe TopicsController, type: :controller do
  describe 'GET #index' do
    context 'with valid credentials' do
      it 'has a 200 status code' do
        sign_in
        get :index
        expect(response.status).to eq(200)
      end

      it 'renders the :index template' do
        sign_in
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
