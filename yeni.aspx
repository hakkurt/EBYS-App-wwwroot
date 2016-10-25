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
        	Response.Write("<p  id=rcorners2>EBYS UYGULAMASI (v1.5) </p>");
		Response.Write("<form method=post action=yeni.aspx>");
		Response.Write("<table align=center width=650 border=0><tr><td class=logo> <a href=default.aspx><img src=doclist.png border =0></a></td>");
		Response.Write("<td class=logo><img src=nsx2.png border =0 alt=nsx align=center></td>");
        	Response.Write("<td class=logo> <a href=yeni.aspx><img src=newdoc.png border =0></a></td></tr></table>");
		Response.Write("<h2>Bu uygulama " + System.Environment.MachineName  + " Sunucusunda çalışıyor</h2>");
		Response.Write("<p  id=rcorners1>");


		Response.Write("<table align=center>");
        	Response.Write("<tr><td>Evrak No : </td><td><input type=text name=frmEvrak_No> </td></tr>");
        	Response.Write("<tr><td>Konu : </td><td><input type=text name=frmKonu> </td></tr>");
		Response.Write("<tr><td>Açıklama : </td><td><input type=text name=frmAciklama> </td></tr>");
		Response.Write("<input type=hidden name=islem value=kaydet>");
               	Response.Write("<tr><td colspan=2 align=center><input type=submit name=buttonSubmit value=Kaydet /></td></tr></table>");
		Response.Write("</form></p></div>");
    }

    void Page_Unload(Object o, EventArgs e)
    {
        
    }

    void kaydet()
    {
	
	string frmEvrak_No = Request.Form["frmEvrak_No"];
        string frmKonu = Request.Form["frmKonu"];
        string frmAciklama = Request.Form["frmAciklama"];

	baglanti = new SqlConnection();
        baglanti.ConnectionString ="Data Source=CLSSQL-AGL.nsx.com;Initial Catalog=EBYS;Integrated Security=False;User Id=sa;Password=Passw0rd;MultipleActiveResultSets=True;MultiSubnetFailover=True" ;
        baglanti.Open(); 
        SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
	cmd.CommandType = System.Data.CommandType.Text;
	cmd.CommandText = "INSERT Evrak (Evrak_No,Konu,Aciklama) VALUES ('"+frmEvrak_No+"','"+frmKonu+"','"+frmAciklama+"')";
	cmd.Connection = baglanti;
	int row=cmd.ExecuteNonQuery();
	
	if (row == 1)
		{
        	Response.Write("<br /><table align=center><tr><td colspan=2 align=center>kayıt başarılı");
		Response.Write("</td></tr></table>");	
		}
	else
		{
        	Response.Write("<br /><table align=center><tr><td colspan=2 align=center>hata oluştu");
		Response.Write("</td></tr></table>");
		}


	baglanti.Close();


    }

</script>
    
    
</body>
</html>