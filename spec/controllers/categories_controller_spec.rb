require 'spec_helper'

describe CategoriesController do

  describe 'GET show' do
     category = Category.create(name: "Tablets")

    it "assigns the requested category to @category" do
      get :show, id: category.id
      expect(assigns(:category)).to eq category
    end

    it "renders the :show template" do
      get :show, id: category.id
      expect(response).to render_template :show
    end
  end
end
