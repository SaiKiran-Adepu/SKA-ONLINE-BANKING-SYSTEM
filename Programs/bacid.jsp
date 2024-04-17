<%@ include file="packages.jsp"%>
<%!
    Connection con;
    PreparedStatement ps2m, ps2l;
    public void jspInit() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            ps2m = con.prepareStatement("select acid from userreal where acid=(select max(acid) from userreal)");
            ps2l = con.prepareStatement("select acid from userreal where acid=(select min(acid) from userreal)");
        } 
		catch (Exception ex) {
            ex.printStackTrace();
        }
    }
//in this holding the ACID from and to in a bank with a single program 
// and it can imported in user window include send money and request money and 
//in cashier depoiste transfer fund and withdraw fund.....
%>
<%
    ResultSet rs2l = ps2l.executeQuery();
    ResultSet rs2m = ps2m.executeQuery();
     String macid = "";
    String minacid = "";
    while (rs2m.next())
	{
        macid = rs2m.getString(1); // Assign the value to 'macid'
	}
	while(rs2l.next())
	 {
        minacid = rs2l.getString(1);
    }
    //out.println("</table>");
    out.println("</center>");
    // rs2b.close();
%>

<%!
    public void jspDestroy() {
        try {
           
            con.close();
        } 
		catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>
<html>
<head>
<title>Bank Acid from to</title>
</head>
<body>
<script>
    // Assign the JSP variables to JavaScript variables
    var maxAcid = '<%= macid %>'; // need to hold in two places 
    var minAcid = '<%= minacid %>';
    // Now you can use 'maxAcid' and 'minAcid' in your JavaScript code
    document.write("<center>");
	document.write("<p>AC Between ");
	document.write("From Acid:" + minAcid);
	document.write("&nbsp");
    document.write("To Acid:" + maxAcid);
	document.write("</center>");
</script>
</body>
</html>
