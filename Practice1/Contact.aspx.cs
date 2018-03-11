using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSendEmail_Click (object sender, EventArgs e)
    {
        SmtpClient smtpClient = new SmtpClient();
        MailMessage msg = new MailMessage("fafar296@gmail.com", "fafar296@gmail.com");
        msg.Subject = txtSubject.Text;
        msg.Body = txtBody.Text;


        //settings specific to the mail service - eg. server location, port number and that ssl is required
        smtpClient.Host = "smtp.gmail.com";
        smtpClient.Port = 587;
        smtpClient.Enabled = true;

        //create credentials - eg. username and password for the account
        System.Net.NetworkCredentials credentials = new System.Net.NetworkCredential("fafar296@gmail.com", "tindizanadia");
        smtpClient.Credentials = credentials;

    }
}