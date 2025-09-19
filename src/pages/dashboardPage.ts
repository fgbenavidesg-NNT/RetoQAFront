import { expect } from "@playwright/test";

export default class DashboardPage{
    private Elements = {
        dashboardTitle: "//div[@class='app_logo']",
        primerProducto: "//button[@id='add-to-cart-sauce-labs-backpack']",
        carritoCompras: "//a[@class='shopping_cart_link']"
    }
    async loginSuccess(){
        await global.page.waitForSelector(this.Elements.dashboardTitle);
        await expect(global.page.locator(this.Elements.dashboardTitle)).toBeVisible();
    }
    async agregarProductoCarrito(){
        await global.page.waitForSelector(this.Elements.primerProducto);
        await global.page.click(this.Elements.primerProducto);
    }
    async voyAlCarrito(){
        await global.page.waitForSelector(this.Elements.carritoCompras);
        await global.page.click(this.Elements.carritoCompras);
    }


}