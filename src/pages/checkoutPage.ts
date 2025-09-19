export default class CheckoutPage {
    private Elements = {
        firstName : "//input[@id='first-name']",
        lastName : "//input[@id='last-name']",
        zipOrPostalCode : "//input[@id='postal-code']",
        continue : "//input[@id='continue']",
        finish : "//button[@id='finish']",
        completeOrder : "//h2[@class='complete-header']"
    }
    async ingresoInformacionPersonal(firstName : string, lastName: string, zipCode: string ) {
        await global.page.waitForSelector(this.Elements.firstName);
        await global.page.type(this.Elements.firstName, firstName);
        await global.page.type(this.Elements.lastName, lastName);
        await global.page.type(this.Elements.zipOrPostalCode, zipCode);
        await global.page.click(this.Elements.continue);
    }

    async finalizoCompra() {
        await global.page.click(this.Elements.finish);
    }

    async obtenerTextoConfirmacion(){
        return await global.page.textContent(this.Elements.completeOrder) as string;
    }


}