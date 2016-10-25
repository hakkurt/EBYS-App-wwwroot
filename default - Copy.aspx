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

        baglanti = new SqlConnection();
        baglanti.ConnectionString ="Data Source=CLSSQL-AGL.nsx.com;Initial Catalog=EBYS;Integrated Security=False;User Id=sa;Password=Passw0rd;MultipleActiveResultSets=True;MultiSubnetFailover=True" ;
        baglanti.Open();
  
        Response.Write("<div align=center>");
        Response.Write("<br><p  id=rcorners2>EBYS UYGULAMASI</p>");
	Response.Write("<table align=center><tr><td>  <a href=default.aspx>  Evrak Listesi  </a></td>");
        Response.Write("<td><a href=yeni.aspx>Yeni Evrak</a></td></tr></table><br>");

 	Response.Write("<p  id=rcorners1>");
	

        listele();

	Response.Write("</p></div>");

    }

    void Page_Unload(Object o, EventArgs e)
    {
        baglanti.Close();
    }

    void listele()
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM Evrak", baglanti);
        SqlDataReader sonuc = cmd.ExecuteReader();

        Response.Write("<table align=center>");
        Response.Write("<tr><th>Evrak No</th>");
        Response.Write("<th>Konu</th>");
        Response.Write("<th>Açıklama</th></tr>");


        while (sonuc.Read())
        {

            Response.Write("<tr class=odd>");
            Response.Write("<td>" + sonuc.GetString(1)+ "</td>");
            Response.Write("<td>" + sonuc.GetString(2)+ "</td>");
            Response.Write("<td>" + sonuc.GetString(3)+ "</td>");
            Response.Write("</tr>");

        }

        Response.Write("</table>");
        Response.Write("<h2>Bu uygulama " + System.Environment.MachineName + " Sunucusunda çalışıyor</h2>");

    }


</script>
    <br /><br />
        <center>
            <image src="nsx.jpg" border ="0" align="center"></image>

        </center>

    <form id="form1" runat="server">
    </form>
</body>
</html>