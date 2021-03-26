module Sections
    module Produto
      class ProductDetails < SitePrism::Section
          elements  :group_select, 'select.group__select'
          elements :options, 'select.group__select option'
          element :option1, 'select.group__select > option[id="#option-1"]'
          element  :btn_add_cart, 'button.button.button__primary.button--large'

          element :product_name, 'h2.h2'
          element :product_price, '.partners-tab__content-price-real > div > span:nth-child(1)'

          def selects
            group_select.each do |select| 
              select.gclick 
              select.all('option').last.gclick
            end
          end
      end
    end
end