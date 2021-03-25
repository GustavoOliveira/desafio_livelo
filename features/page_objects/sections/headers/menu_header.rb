module Sections
  module Headers
    class MenuHeader < SitePrism::Section
        elements :item_menu, '.menus__list-item.gtm-element-event'
        elements :sub_item_menu, '.menus__list-item.gtm-element-event li'
        elements :product_category, '#ul-com-produtos li'
    end
  end
end