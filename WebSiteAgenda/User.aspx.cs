using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void User_ExceptionHandle(object sender, SqlDataSourceStatusEventArgs e)
	{
		if (e.Exception != null)
		{
			lMsg.Text = "The register can not be duplicated or empty";
			e.ExceptionHandled = true;
		}
	}
}