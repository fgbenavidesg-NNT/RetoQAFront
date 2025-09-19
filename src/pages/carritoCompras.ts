export default class CarritoCompras {
    private Elements = {
        checkout : "//button[@id='checkout']"
    }
    async procedoCheckout() {
        await global.page.waitForSelector(this.Elements.checkout);
        await global.page.click(this.Elements.checkout);
    }

}