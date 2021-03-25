require_relative '../../sections/carrinho/carrinho.rb'

module Pages
  module Carrinho
    class Carrinho < SitePrism::Page
      section :cart, Sections::Carrinho::Cart, 'div.stack-box.container.flex-container'
    end
  end
end
