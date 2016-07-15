require_relative "../../../lib/model/product"
require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/warehouse"

RSpec.shared_examples :models do
  before do
    Store::BASKET = []
    Store::WAREHOUSE = []
    Store::PRODUCTS = []
  end
end
