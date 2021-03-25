# encoding: utf-8
# language:pt

@adicionar_produto_carrinho
Funcionalidade: Adicionar produto no carrinho
  Contexto: Home
    Dado que esteja na home
    
    @add_busca
    Esquema do Cenário: Adicionar produto no carrinho pela busca
      Quando selecionar um "<produto>" pela busca
      E adicionar produto ao carrinho
      Então o produto deverá estar no carrinho

      Exemplos:
        | produto         |
        | cafeteira       |
        | aspirador de pó |
        | ferro de passar |
        | pen drive       |

    @add_menu
    Cenário: Adicionar produto no carrinho pela categoria
      Quando selecionar um produto pela categoria
      E adicionar produto ao carrinho
      Então o produto deverá estar no carrinho