using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void Contact_ExceptionHandle(object sender, SqlDataSourceStatusEventArgs e)
	{
		if (e.Exception != null)
		{
			lMsg.Text = "The register can not be duplicated or empty";
			e.ExceptionHandled = true;
		}
	}


	protected void AddButton_Click(object sender, EventArgs e)
	{
		
		Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");

		ConnectionStringSettings connString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

		SqlConnection connection = new SqlConnection();
		connection.ConnectionString = connString.ToString();

		SqlCommand cmd = new SqlCommand();
		cmd.Connection = connection;
		cmd.CommandText = "Insert into Contact (Name,Email,PhoneNumber) values (@Name,@Email,@PhoneNumber)";
		cmd.Parameters.AddWithValue("Name", NameTextBox.Text);
		cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);
		cmd.Parameters.AddWithValue("PhoneNumber", PhoneNumberTextBox.Text);
		connection.Open();
		cmd.ExecuteNonQuery();
		connection.Close();
		GridView1.DataBind();
	}
}