require 'spec_helper'

describe CartsController do

  before(:each) do
    @cart = Cart.create

    @products = [ Product.create(title: "title", description: "bike",
                                 price: 2.99,    photo: nil) ]
  end

  describe 'GET #index' do

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end

    context "given products are added to the cart" do


      it "populates an array of products" do
        get :index
        expect(assigns(:products)).to match_array @products
      end
    end

  end
end