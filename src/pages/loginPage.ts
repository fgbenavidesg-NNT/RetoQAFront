export default class LoginPage {
    private Elements = {
        usernameInput: "//input[@id='user-name']",
        passwordInput: "//input[@id='password']",
        loginBtn: "//input[@id='login-button']",
        errorMessage: "//h3[@data-test='error']"
    }
    async navigateToOrangePage() {
        await global.page.goto(process.env.BASEURL);
        await global.page.waitForSelector(this.Elements.usernameInput);
    }
    async login(user: string, password: string) {
        await global.page.waitForSelector(this.Elements.usernameInput);
        await global.page.type(this.Elements.usernameInput, user);
        await global.page.type(this.Elements.passwordInput, password)
        await global.page.click(this.Elements.loginBtn);
    }
     async obtenerTextoError(){
        return await global.page.textContent(this.Elements.errorMessage) as string;
    }
}