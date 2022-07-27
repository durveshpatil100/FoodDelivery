<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<% 
try
{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	String q1= "create table users(name varchar(100),email varchar(100)primary key, mobilenumber bigint, securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(100))";
	String q2= "create table item(id int, name varchar(100), category varchar(100), price int, active varchar(100))";
	String q3= "create table cart(email varchar(100), item_id int, quantity int, price int, total int, address varchar(100), mobileNumber bigint, orderTime varchar(100), deliveryTime varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10))";
	String q4= "create table message(id int AUTO_INCREMENT, email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id) )";
	//System.out.print(q1);
	//System.out.print(q2);
	//System.out.print(q3);
	System.out.print(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
	System.out.println("Table created");
	con.close();
}
catch(Exception e)
{
	System.out.print(e);
}
%>