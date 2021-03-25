Dir[File.join(File.dirname(__FILE__), 'page_objects/pages/*.rb')]
  .sort.each { |file| require file }

module Pages
  class ECPages
    class << self
      def home
        Pages::Home::Home.new
      end 

      def produto
        Pages::Produto::Produto.new
      end 

      def carrinho
        Pages::Carrinho::Carrinho.new
      end 
    end
  end
end
