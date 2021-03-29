Dado("que esteja na home") do
  @home = $ec_pages.home
  @home.load
end

Quando("selecionar um {string} pela busca") do |produto|
  @header = @home.main_header
  @header.input_search.gset(produto)
  @header.btn_search.gclick

  @home.select_product
end

Quando("adicionar produto ao carrinho") do
  @produto = $ec_pages.produto

  @produto.product_details.selects if @produto.product_details.has_group_select?
  @produto_preco = @produto.product_details.product_price.text
  @produto_nome = @produto.product_details.product_name.text
  @produto_url = current_url

  sleep 2
  @produto.product_details.btn_add_cart.click
end

Então("o produto deverá estar no carrinho") do
  @carrinho = $ec_pages.carrinho

  @carrinho.cart_info.wait_until_cart_item_visible
  preco_carrinho = @carrinho.cart_info.product_price_cart.text.delete(' Pontos')

  expect(@carrinho.cart_info.product_name_cart.text).to have_content @produto_nome

  unless @produto_preco.eql? preco_carrinho
    expect(@carrinho.cart_info.price_msg.text).to eql "Atenção! O valor desse produto sofreu uma alteração." 
  end
end

Quando("selecionar um produto pela categoria") do
  @menu = @home.menu_header
  @menu.item_menu[0].hover
  @menu.sub_item_menu[0].hover
  @menu.product_category[0].gclick

  @home.select_product
end