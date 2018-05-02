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

    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        //send email using a mail server that requires login credentials and a secure connection, eg. gmail

        //create mail client and message with to and from address. and set message subject and body
        SmtpClient smtpClient = new SmtpClient();
        MailMessage msg = new MailMessage("fafar296@gmail.com", "fafar296@gmail.com");
        msg.Subject = txtSubject.Text;
        msg.Body = txtBody.Text;

        //settings specific to the mail service, eg. server location, port number and that sll is required
        smtpClient.Host = "smtp.gmail.com";
        smtpClient.Port = 587;
        smtpClient.EnableSsl = true;

        //create credentials - eg. username and password for the account
        System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("fafar296@gmail.com", "tindizanadia");
        smtpClient.Credentials = credentials;
        msg = new MailMessage("fafar296@gmail.com", "fafar296@gmail.com");

        try
        {
            smtpClient.Send(msg);
            Literal1.Text = "<p> Success, mail send using SMTP with security connection and credentials</p>";
        }

        catch (Exception ex)
        {
            //display the full eeror to the user
            Literal1.Text = "<p> Send failed:" + ex.Message + "." + ex.InnerException + "</p>";

        }

    }
}