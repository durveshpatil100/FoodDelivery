<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String item_id= request.getParameter("id");
int quantity=1;
int item_price=0;
int item_total=0;
int cart_total=0;

int z=0;
try
{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from item where id='"+item_id+"'");
	while(rs.next())
	{
		item_price=rs.getInt(4);
		item_total=item_price;
	}
	ResultSet rs1 = st.executeQuery("select * from cart where item_id='"+item_id+"' and email='"+email+"' and address is NULL");
	while(rs1.next())
	{
		cart_total = rs1.getInt(5);
		cart_total = cart_total+item_total;
		quantity = rs1.getInt(3);
		quantity = quantity+1;
		z=1;
	}
	if(z==1)
	{
		st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where item_id='"+item_id+"' and email='"+email+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0)
	{
		PreparedStatement ps = con.prepareStatement("insert into cart(email,item_id,quantity,price,total) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, item_id);
		ps.setInt(3, quantity);
		ps.setInt(4, item_price);
		ps.setInt(5, item_total);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
	}
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>