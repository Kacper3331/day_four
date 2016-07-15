require "web_helper"

RSpec.describe "GET /", type: :request do
  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eq(200)
  end

  it "returns valid html Content-Type" do
    expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "returns h3 element with \'List of Available products\' value" do
    expect(last_response.body).to include("<h3>List of Available products</h3>")
  end

  it "returns button to add first product to the basket" do
    expect(last_response.body).to include(
      "<a class=\"btn btn-success btn-large add_to_basket_link\" href=\"products/1\">Add to basket</a>"
    )
  end

  private
  def do_request
    get "/"
  end
end
