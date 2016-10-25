<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>EBYS Uygulaması</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="site.css" />
</head>

<body>
   
    
<script runat="server">

    SqlConnection baglanti;

    private void Page_Load(object sender, EventArgs e)
    {

        baglanti = new SqlConnection();
	baglanti.ConnectionString ="Data Source= clssqlag1-l.corp.local;Initial Catalog=EBYS;Integrated Security=False;User Id=sa;Password=VMware1!;MultipleActiveResultSets=True;MultiSubnetFailover=True" ;
        baglanti.Open();
  
        Response.Write("<div align=center>");
        Response.Write("<p  id=rcorners2>EBYS UYGULAMASI (v1.5) </p>");
	Response.Write("<table align=center width=650 border=0><tr><td class=logo> <a href=default.aspx><img src=doclist.png border =0></a></td>");
	Response.Write("<td class=logo><img src=nsx2.png border =0 alt=nsx align=center></td>");
        Response.Write("<td class=logo> <a href=yeni.aspx><img src=newdoc.png border =0></a></td></tr></table>");
	Response.Write("<h2>Bu uygulama " + System.Environment.MachineName  + " Sunucusunda çalışıyor</h2>");

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
	cmd = new SqlCommand("SELECT @@SERVERNAME", baglanti);
        
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
	sonuc.Close();
	Response.Write("<tr><th colspan=3>Veritabanı Sunucusu :" + cmd.ExecuteScalar() +"</td></tr>");
        Response.Write("</table>");
        
    }


</script>
    
    
</body>
</html>