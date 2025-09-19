Feature: Completar proceso de compra de un producto en SauceDemo
  As un cliente de Sauce Demo
  I want poder iniciar sesión, agregar productos al carrito y completar una compra
  So poder adquirir los productos que necesito

@comprar_productos_usuario_valido 
Scenario: Comprar productos exitosamente con usuario válido
  Given estoy en la página de SauceDemo
  When ingreso mis credenciales username "standard_user" y password "secret_sauce"
  Then el inicio de sesión es satisfactorio
  When agrego el primer producto al carrito
  And voy al carrito de compras
  And procedo al checkout
  And ingreso mi información personal "Felix", "Benavides", "14003"
  And finalizo la compra
  Then el producto se compra correctamente

@comprar_productos_usuario_invalido
Scenario: usuario no puede iniciar sesión con credenciales inválidas
  Given estoy en la página de SauceDemo
  When ingreso mis credenciales username "locked_out_user" y password "secret_sauce"
  Then se muestra un mensaje de error de login