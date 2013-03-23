require 'spec_helper'

describe Product do

  before(:each) do
    @product = Product.create(title: "bike", description: "kind of bike",
                              price: 75.00)
  end

  context "when it has a title, description, and price" do

    it "is valid" do
      expect(@product).to be_valid
    end
  end

  context "when missing a title" do

    it "is invalid" do
      @product.title = nil
      expect(@product).to be_invalid
    end

    it "has errors" do
      @product.title = nil
      expect(@product).to have(1).errors_on(:title)
    end
  end

  context "when a title already exists" do
    # before(:each) do
    #   @product.save
    # end

    it "is invalid" do
      @product2 = Product.create(title: @product.title)
      expect(@product2).to be_invalid
    end

    it "has errors" do
      @product2 = Product.create(title: @product.title)
      expect(@product2).to have(1).errors_on(:title)
    end
  end

  context "when missing a description" do

    it "is invalid" do
      @product.description = nil
      expect(@product).to be_invalid
    end

    it "has errors" do
      @product.description = nil
      expect(@product).to have(1).errors_on(:description)
    end
  end

  context "when missing a price" do

    it "is invalid" do
      @product.price = nil
      expect(@product).to be_invalid
    end

    # it "has errors" do
    #   @product.price = nil
    #   expect(@product).to have(2).errors_on(:price)
    # end
  end

  context "when a price of $0.00" do

    it "is invalid" do
      @product.price = 0.00
      expect(@product).to be_invalid
    end

    it "has errors" do
      @product.price = 0.00
      expect(@product).to have(1).errors_on(:price)
    end
  end


end