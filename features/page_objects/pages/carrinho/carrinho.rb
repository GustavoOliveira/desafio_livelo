require_relative '../../sections/carrinho/carrinho_info.rb'

module Pages
  module Carrinho
    class Carrinho < SitePrism::Page
      section :cart_info, Sections::Carrinho::CartInfo, 'div.stack-box.container.flex-container'
    end
  end
end
