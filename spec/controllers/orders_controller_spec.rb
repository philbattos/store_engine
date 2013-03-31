require 'spec_helper'

describe OrdersController do

  describe 'GET #show' do

    before do
      @order1 = Order.create(status: "pending")
    end

    context "given a user is logged in" do

      it "assigns the requested order to @order" do

        get :show, id: @order1.id

        expect(assigns(:order)).to eq @order1
      end

      it "renders the show template" do

        get :show, id: @order1.id

        expect(response).to render_template :show
      end
    end
  end
end