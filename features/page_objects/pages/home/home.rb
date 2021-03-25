require_relative '../../sections/headers/main_header.rb'
require_relative '../../sections/headers/menu_header.rb'

module Pages
  module Home
    class Home < SitePrism::Page
      set_url '/'
      section :main_header, Sections::Headers::MainHeader, '#div-container'
      section :menu_header, Sections::Headers::MenuHeader, '#div-menus__content'

      elements :product_box, 'div.cc-product-item.product-box'

      def select_product
        wait_until_product_box_visible
        product_box[0].gclick
      end
    end
  end
end
