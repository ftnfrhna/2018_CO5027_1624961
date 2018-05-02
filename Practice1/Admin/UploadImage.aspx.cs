using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UploadImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ProductId = Request.QueryString["Id"];
        string filename = ProductId + ".jpg";

        currentImage.ImageUrl = "~/Images/" + filename;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string ProductId = Request.QueryString["Id"];

        string filename = ProductId + ".jpg";
        string savelocation = Server.MapPath("~/Images/" + filename);

        imageFileUpload.SaveAs(savelocation);
    }
}