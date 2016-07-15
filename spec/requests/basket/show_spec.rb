require "web_helper"

RSpec.describe "GET /basket", type: :request do
  context "when basket is empty" do
    before do
      Store::BASKET.clear
      do_request
    end

    it "return status 200" do
      expect(last_response.status).to eq(200)
    end

    it "contains h1 element with \`Your basket is empty\` value" do
      expect(last_response.body).to include("<h1>Your basket is empty</h1>")
    end
  end

  context "when basket is not empty" do
    let(:quantity) { 1 }
    let(:product_id) { 1 }
    let(:add_product_to_basket) { Store::Basket.new(product_id: product_id, quantity: quantity) }
    let(:params) { { "product_id" =>  product_id, "quantity" => quantity } }

    before do
      Store::BASKET.clear
      Store::AddProductToBasket.new(params).call
      do_request
    end

    it "contains name of the product" do
      expect(last_response.body).to include("<td>Chocolate</td>")
    end

    it "contains total price value for products in basket eq to 12.29 zł" do
      expect(last_response.body).to include("<td>Total: 12.29 zł</td>")
    end

    it "contains quantity value for product in basket eq to 1" do
      expect(last_response.body).to include("<td>#{quantity}</td>")
    end
  end

  private
  def do_request
    get "/basket"
  end
end
