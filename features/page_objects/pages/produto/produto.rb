require_relative '../../sections/produto/produto_detalhes.rb'

module Pages
  module Produto
    class Produto < SitePrism::Page
      section :product_details, Sections::Produto::ProductDetails, 'div.product-details'
    end
  end
end
