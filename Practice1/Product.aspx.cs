using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;

public partial class Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        decimal postagePackagingCost = 3.95m;
        decimal productPrice = 10.00m;
        int quantityofProduct = int.Parse(DDLQuantity.SelectedValue);
        decimal subTotal = (quantityofProduct * productPrice);
        decimal total = subTotal + postagePackagingCost;

        //var configure = ConfigManager.Instance.GetProperties();
        //var accessToken = new OAuthTokenCredential(configure).GetAccessToken();
        //var apiContext = new APIContext(accessToken);

        var clientId = "AfFZ85Lh6MEWNaKc7zmBtPqMSImVyUuAnaIk27Ze3hzOi93h3wJLlyfVnUO-LdQHtIllOkRXqd4j7zrO";
        var clientSecret = "EMFTXYNcf5bPZxfs6pz7K0oGc27FKaJO9STjo3RQjvWBRPGVO9PK_z_N8KTCs1-06otxU8qPI0Frz0QW";
        var sdkConfig = new Dictionary<string, string> {
            { "mode", "sandbox" },
            { "clientId", clientId },
            { "clientSecret", clientSecret }

            };

        var accessToken = new OAuthTokenCredential(clientId, clientSecret, sdkConfig).GetAccessToken();
        var apiContext = new APIContext(accessToken);
        apiContext.Config = sdkConfig;

        var Item = new Item();
        Item.name = "Product 1";
        Item.currency = "GBP";
        Item.price = productPrice.ToString();
        Item.sku = "Product 1";
        Item.quantity = quantityofProduct.ToString();

        var details = new Details();
        details.tax = "0";
        details.shipping = postagePackagingCost.ToString();
        details.subtotal = subTotal.ToString("0.00");

        var amount = new Amount();
        amount.currency = "GBP";
        amount.total = total.ToString("0.00");
        amount.details = details;

        var transaction = new Transaction();
        transaction.description = "Your order of the items";
        transaction.invoice_number = Guid.NewGuid().ToString(); // ID of a record storing the order
        transaction.amount = amount;
        transaction.item_list = new ItemList
        {
            items = new List<Item> { Item }
        };

        var customer = new Payer();
        customer.payment_method = "paypal";

        var URL = new RedirectUrls();
        URL.cancel_url = "http://" + HttpContext.Current.Request.Url.Authority + "/product.aspx";

        URL.return_url = "http://" + HttpContext.Current.Request.Url.Authority + "/CompletePurchase.aspx"; ;

        var pay = Payment.Create(apiContext, new Payment
        {
            intent = "sale",
            payer = customer,
            transactions = new List<Transaction> { transaction },
            redirect_urls = URL
        });

        Session["PaymentID"] = pay.id;

        foreach (var link in pay.links)
        {
            if (link.rel.ToLower().Trim().Equals("approval_url"))
                // redirect user if appropiate link is found
                Response.Redirect("https://www.paypal.com/myaccount/money/cards/new/manual");
        }

    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}
