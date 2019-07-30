require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user)     {create(:user)}
  let(:category) {create(:category)}

  describe 'GET #index' do
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    context 'login' do
      before do
        session[:user_id] = user.id
      end

      it "assigns the requested item to @item" do
        get :new
        expect(assigns(:item)).to be_a_new(Item)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not login' do
      it "redirects to new_session_path" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:params) { {item: attributes_for(:item, images: Faker::Avatar.image, seller_id: user.id, buyer_id: user.id, category_id: category.id)} }

    context 'login' do
      before do
        session[:user_id] = user.id
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it "count up item" do
          expect{subject}.to change(Item, :count).by(1)
        end

        it "redirects to root_path" do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context 'can not save' do
        let(:invalid_params) { {item: attributes_for(:item, name: nil)} }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{subject}.not_to change(Item, :count)
        end

        it 'renders new' do
          subject
          expect(response).to render_template :new
        end
      end
    end

    context 'not login' do
      it 'redirects to new_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end

