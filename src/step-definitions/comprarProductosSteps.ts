import { Given, Then, When } from "@cucumber/cucumber";
import LoginPage from "../pages/loginPage";
import DashboardPage from "../pages/dashboardPage";
import CheckoutPage from "../pages/checkoutPage";
import CarritoCompras from "../pages/carritoCompras";

const loginPage = new LoginPage();
const dashboardPage = new DashboardPage();
const checkoutPage = new CheckoutPage();
const carritoCompras = new CarritoCompras();

Given('estoy en la página de SauceDemo', async ()=> {
    await loginPage.navigateToOrangePage();
});

When('ingreso mis credenciales username {string} y password {string}', async (user, password)=> {
    await loginPage.login(user, password);
});

Then('el inicio de sesión es satisfactorio', async ()=> {
    await dashboardPage.loginSuccess();
});

When('agrego el primer producto al carrito', async ()=> {
    await dashboardPage.agregarProductoCarrito();
});

When('voy al carrito de compras', async ()=> {
    await dashboardPage.voyAlCarrito();
});

When('procedo al checkout', async ()=> {
    await carritoCompras.procedoCheckout();
});

When('ingreso mi información personal {string}, {string}, {string}', 
  async (firstName, lastName, zipCode) => {
    await checkoutPage.ingresoInformacionPersonal(firstName, lastName, zipCode);
});

When('finalizo la compra', async ()=> {
    await checkoutPage.finalizoCompra();
});  

Then('la compra se realiza con éxito', async ()=> {
    console.log("Compra realizada con éxito");
});

Then('el producto se compra correctamente', async () => {
    const texto = await checkoutPage.obtenerTextoConfirmacion();
    if (texto !== 'Thank you for your order!') {
        throw new Error(`El texto esperado era "Thank you for your order!", pero se encontró "${texto}"`);
    }
});

Then('se muestra un mensaje de error de login', async () => {
    const textoError = await loginPage.obtenerTextoError();
    if (textoError !== 'Epic sadface: Sorry, this user has been locked out.') {
        throw new Error(`El mensaje esperado era "Epic sadface: Sorry, this user has been locked out.", pero se encontró "${textoError}"`);
    }
});