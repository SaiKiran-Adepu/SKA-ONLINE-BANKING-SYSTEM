<html>
<head>
<title>Fund Withdraw</title>
</head>
<body onkeydown="return (event.keyCode == 154)">
<%@ include file="sessionval.jsp"%>
<%@ include file="packages.jsp"%>
<%@ page errorPage="error.jsp" %> 
<%!
    Connection con;
    PreparedStatement ps1,ps2,ps4,ps24;
    public void jspInit()
    {
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            ps2 = con.prepareStatement("select amt from userreal where acid=?");
            ps1 = con.prepareStatement("update userreal set amt=amt-? ,trm=? where acid=?");
            ps4 = con.prepareStatement("insert into skatrns(trno,fund,acid,trm,dot,dot1) values(?,?,?,?,?,?)");
		    ps24 = con.prepareStatement("select trno,fund,acid,dot from skatrns where dot=? order by dot DESC");
			
		}
		
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
   /* String param = request.getParameter("s1");
    if(param =="link")
    {
        ResultSet rs = ps2.executeQuery();
        out.println("<table>");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        rs.close();
    }
    else
    {*/
     
		
		  
		
	       int acid=Integer.parseInt(request.getParameter("acid12"));
		   int amt=Integer.parseInt(request.getParameter("amt12"));
	       String trm = request.getParameter("trm12");
		   ps1.setInt(1,amt);
		   ps1.setString(2,trm);
		   ps1.setInt(3,acid);
		   
		   
		   
		   int trno=Integer.parseInt(request.getParameter("trnno12"));
				int amtt=Integer.parseInt(request.getParameter("amt12"));
		int acidt=Integer.parseInt(request.getParameter("acid12"));
					    String trmt = request.getParameter("trm12");
		               String dot = request.getParameter("dot2");
					   String dota = request.getParameter("dot3");

		                    ps4.setInt(1,trno);
		                    ps4.setInt(2,amtt);
	                     	ps4.setInt(3,acidt);
		                    ps4.setString(4,trmt);
							ps4.setString(5,dot);
							ps4.setString(6,dota);
														
		   
		   
		   int cnt=ps1.executeUpdate();
           if(cnt>0)
		   {
			   out.println("<center><font color=blue><h3>Withdraw A/C Ammount Successfull</h3></font></center>");
		       out.println("<center>");
			  out.println("<table border=2px bgcolor=	#b0c4de width=80>");
			  out.println("<tr>");
			  out.println("<th>ACID</th>");
			  out.println("<th>FUND</th>");
			  out.println("</tr>");
			    out.println("<tr>");
			  out.println("<td>"+acid+"</td>");
			  out.println("<td>"+amt+"</td>");
			  out.println("</tr>");
			  out.println("</table>");
			  out.println("</center>");
			  out.println("<br>");
     		 
			   out.println("<center><img src=images/money.jpg width=600 height=250></img></center>");
			   out.println("<center><font color=blue><h3>Don't Refresh This Page Again! GO BACK</h3></font></center>");
				//out.println("<center><h2><font color=green>This Site IS Developed By SKA Developments</font></h2></center>");
		   
		   
		       int cntt = ps4.executeUpdate();
		        if(cntt>0)
		         {
			       out.println("<center><font color=blue><h3>Transaction Successfully Recorded</h3></font></center>");
		        	  
         
				   //int t=Integer.parseInt(request.getParameter("acid"));
               String dot1 = request.getParameter("dot2");		       
			   //ps24.setInt(1,t);
		        ps24.setString(1,dot1);
				 ResultSet rs24 = ps24.executeQuery();
		 
		 out.println("<center>");
		out.println("<table border=3 bgcolor=#ffefd5 height=10 width=500>");
		out.println("<tr>");
		out.println("<th>TRNO</th>");
		out.println("<th>FUND/RS</th>");
		out.println("<th>FACID</th>");
		out.println("<th>DOT</th>");
		out.println("</tr>");
         while(rs24.next())
        {
            out.println("<tr>");
			out.println("<td>"+rs24.getInt(1)+"</td>");
		    out.println("<td>"+rs24.getInt(2)+"</td>");
			out.println("<td>"+rs24.getInt(3)+"</td>");
		    out.println("<td>"+rs24.getString(4)+"</td>");
		    out.println("</tr>");
          }
        out.println("</table>");
		out.println("</center>");
		out.println("<br>");
			



					  
     		     
		   
		   }
		   }
			
		    else
		   {
			   out.println("<center><font color=blue><h3>Withdraw Amount Not Successfull/AC Not EXIST</h3></font></center>");
		  
		   
		}
%>
<%!
    public void jspDestroy()
    {
        try
        {
            ps2.close();
            ps1.close();
			ps4.close();
			ps24.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 40%; //table styles
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</body>
</html>
