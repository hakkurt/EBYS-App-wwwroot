<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

SqlConnection baglanti;

    private void Page_Load(object sender, EventArgs e)
    {

        baglanti = new SqlConnection();
        baglanti.ConnectionString ="Data Source=CLSSQL-AGL.nsx.com;Initial Catalog=EBYS;Integrated Security=False;User Id=sa;Password=Passw0rd;MultipleActiveResultSets=True;MultiSubnetFailover=True" ;
        baglanti.Open();
        
	baglanti.Close();

    }
</script>

Islem Tamam