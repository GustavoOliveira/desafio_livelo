module Sections
  module Headers
    class MainHeader < SitePrism::Section
        element :input_search, '#input-search'
        element :btn_search, '#span-searchIcon'
    end
  end
end