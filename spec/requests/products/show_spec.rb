require "web_helper"

RSpec.describe "GET /products/:id", type: :request do
  context "when product doesn\`t exist" do
    before do
      do_request(20)
    end

    it "returns 404 HTTP code" do
      expect(last_response.status).to eq(404)
    end
  end

  context "when product exist" do
    let(:product) { Store::FetchProducts.new.call.first }

    before do
      do_request(product.id)
    end

    it "returns 200 HTTP code" do
      expect(last_response.status).to eq(200)
    end

    it "returns valid html Content-Type" do
      expect(last_response.headers["Content-Type"]).to include("text/html")
    end

    it "contains product name" do
      expect(last_response.body).to include("#{product.name}")
    end

    it "contains h2 element with \'Add product to basket\' value" do
      expect(last_response.body).to include("<h2>Add product to basket</h2>")
    end

    it "contains button with \'Add to basket\' value" do
      expect(last_response.body).to include(
        "<input class=\"button\" type=\"submit\" value=\"Add to basket\" />"
      )
    end
  end

  private
  def do_request(id)
    get "/products/#{id}"
  end
end
