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

  @carrinho.cart.wait_until_cart_item_visible
  expect(@produto_preco).to eql @carrinho.cart.product_price_cart.text.delete(' Pontos')

  # o produto pode mudar de nome ao ser colocado no carrinho
  if @produto_nome.eql? @carrinho.cart.product_name_cart.text
    expect(@produto_nome).to eql @carrinho.cart.product_name_cart.text
    puts @produto_nome
  else
    expect(@carrinho.cart.product_name_cart[:href]).to have_content @produto_url
    puts @carrinho.cart.product_name_cart[:href]
    puts @produto_url
  end
end

Quando("selecionar um produto pela categoria") do
  @menu = @home.menu_header
  @menu.item_menu[0].hover
  @menu.sub_item_menu[0].hover
  @menu.product_category[0].gclick

  @home.select_product
end