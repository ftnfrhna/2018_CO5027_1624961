using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Owin;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;

public partial class RegSign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var identityDbContext = new IdentityDbContext("IdentityConnectionString");
        var userStore = new UserStore<IdentityUser>(identityDbContext);
        var userManager = new UserManager<IdentityUser>(userStore);
        var user = userManager.Find(txtLoginUsername.Text, txtLoginPassword.Text);
        if (user != null)
        {
            LogUserIn(userManager, user);
        }
        else
        {
            litLoginError.Text = "Invalid username or password";
        }
    }

    private void LogUserIn(UserManager<IdentityUser> usermanager, IdentityUser user)
    {
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        var userIdentity = usermanager.CreateIdentity(
            user, DefaultAuthenticationTypes.ApplicationCookie);
        authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

        if (Request.QueryString["~/register.aspx"] != null)
        {
            Response.Redirect(Request.QueryString["~/register.aspx"]);
        }

        else
        {
            string UserRoles = usermanager.GetRoles(user.Id).FirstOrDefault();
            if (UserRoles.Equals("Admin"))
            {
                if (UserRoles.Equals("Admin"))
                {
                    Response.Redirect("Admin/index.aspx");
                }
                
            }
        }
    }


    protected void btnReg_Click(object sender, EventArgs e)
    {
        var identityDBContext = new IdentityDbContext("IdentityConnectionString");
        var roleStore = new RoleStore<IdentityRole>(identityDBContext);
        var roleManager = new RoleManager<IdentityRole>(roleStore);
        var userStore = new UserStore<IdentityUser>(identityDBContext);
        var manager = new UserManager<IdentityUser>(userStore);

        IdentityRole adminRole = new IdentityRole("RegisteredUser");
        roleManager.Create(adminRole);
        var user = new IdentityUser()
        {
            UserName = txtRegUsername.Text,
            Email = txtRegUsername.Text
        };

        IdentityResult result = manager.Create(user, txtRegPassword.Text);
        if (result.Succeeded)
        {
            manager.AddToRole(user.Id, "RegisteredUser");
            manager.Update(user);
            litRegisterError.Text = "Registration Successful";
        }
        else
        {
            litRegisterError.Text = "An error has occured: " + result.Errors.FirstOrDefault();
        }
    }
}
