<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="site.css" />
</head>

<body>
  
   

<script runat="server">

    SqlConnection baglanti;

    private void Page_Load(object sender, EventArgs e)
    {

	   if (Request.Form["islem"] == "kaydet")
		{
        	kaydet();		
		}
    	        
		Response.Write("<div align=center>");
         	Response.Write("<br><p  id=rcorners2>EBYS UYGULAMASI</p>");
 	       	Response.Write("<form method=post action=giris.aspx>");
		
		Response.Write("<p  id=rcorners1>");


		Response.Write("<table align=center>");
        	Response.Write("<tr><td>Kullanıcı : </td><td><input type=text name=frmusername> </td></tr>");
        	Response.Write("<tr><td>Parola : </td><td><input type=password name=frmpassword> </td></tr>");
		Response.Write("<input type=hidden name=islem value=kaydet>");
               	Response.Write("<tr><td colspan=2 align=center><input type=submit name=buttonSubmit value=Giriş /></td></tr></table>");
		Response.Write("</form></p></div>");
    }

    void Page_Unload(Object o, EventArgs e)
    {
        
    }

    void kaydet()
    {
	
	string frmusername = Request.Form["frmusername"];
        string frmpassword = Request.Form["frmpassword"];
        
	baglanti = new SqlConnection();
        baglanti.ConnectionString ="Data Source=CLSSQL-AGL.nsx.com;Initial Catalog=EBYS;Integrated Security=False;User Id=sa;Password=Passw0rd;MultipleActiveResultSets=True;MultiSubnetFailover=True" ;
        baglanti.Open(); 
        SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
	cmd.CommandType = System.Data.CommandType.Text;
	cmd.CommandText = "SELECT * from users where username='"+frmusername+"' and password='"+frmpassword+"'"; 	
	cmd.Connection = baglanti;
	SqlDataReader row=cmd.ExecuteReader();
	

	if (row.Read())
		{
        	Response.Redirect("default.aspx");
		baglanti.Close();	
		}
	else
		{
        	Response.Write("<br /><table align=center><tr><td colspan=2 align=center>hatalı giriş");
		baglanti.Close();
		}


	


    }

</script>
    <br /><center>
        <img src=nsx2.png border =0 alt=nsx align=center>
</center>
    
</body>
</html>