module Sections
    module Carrinho
      class CartInfo < SitePrism::Section
          elements :cart_item, 'div.cart-list__item'
          element :product_name_cart, '.cart-list__subtitle.body-text.body-text--small.cart-list__text--blue'
          element :product_price_cart, '.cart-list__value.body-text.body-text--small.body-text--bold.cart-list__text--blue'     
          element :price_msg, 'div.cart-list__price-msg-text span'
      end
    end
end