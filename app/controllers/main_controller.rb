class MainController < ApplicationController
  def index
    client = Shopsense::API.new('partner_id' => 'uid0000-00000000-00')
    response = client.search("women")

    raw_products = JSON.parse(response)["products"]

    @products = raw_products.map do |product|
      product = OpenStruct.new(product)
      image = product.images.find { |i| i["sizeName"] == 'Large' }
      product.image = OpenStruct.new(image)
      product
    end
  end
end

