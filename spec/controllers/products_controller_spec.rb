require 'spec_helper'

describe ProductsController do
  let!(:product) { [ Product.create(title: "title", description: "bike",
                                    price: 2.99) ] }

  describe 'GET #index' do

    it "populates an array of products" do
      get :index
      expect(assigns(:products)).to match_array product
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do

    let!(:product1) { Product.create(title: "bike", description: "it rides",
                                     price: 2.99) }

    it "assigns the requested product to @product" do
      get :show, id: product1.id
      expect(assigns(:product)).to eq product1
    end

    it "renders the :show template" do
      get :show, id: product1.id
      expect(response).to render_template :show
    end
  end
end