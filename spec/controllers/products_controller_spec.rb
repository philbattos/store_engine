require 'spec_helper'

describe ProductsController do
  let!(:products) { [ Product.create(title: "title", description: "bike",
                                     price: 2.99,    photo: nil) ] }

  describe 'GET #index' do

    it "populates an array of products" do
      get :index
      expect(assigns(:products)).to match_array products
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do

    it "assigns the requested product to @product" do
      get :show, id: product.id
      expect(assigns(:product)).to eq product
    end

    it "renders the :show template" do
      get :show, id: product.id
      expect(response).to render_template :show
    end
  end
end