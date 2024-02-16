<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function go()
{
 window.history.go(-1);
}
setTimeout("go()",3000);
</script>
<style>
body {
  background-color: lightblue;
  opacity:0.8;
  background-size:100% 100%
  
}
h1{
  color: white;
  text-align: center;
}
table {border:5px solid #900;}
p,li {
  font-family: verdana;
  font-size: 30px;
  text-align: center;
   color: blue;
}
#center{
   text:align:center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>刪除數據</title>
</head>
<body>
    <div style="margin: auto; width: 80%">
        <sql:setDataSource var="connection" driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost/commodity?useSSL=false&characterEncoding=utf8"
            user="root" password="123456" />
       <% 
       
      
      
       try
       {
                Class.forName("com.mysql.cj.jdbc.Driver");
        
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/commodity", "root", "123456");
                  Statement st=conn.createStatement();
                  String query = "truncate table comm";
                	   

                	      // create the mysql insert preparedstatement
                	      PreparedStatement preparedStmt = conn.prepareStatement(query);
                	   
                	    
             

                	      // execute the preparedstatement
                	      preparedStmt.execute();
                	      
                	    
//                  int i=st.executeUpdate("insert into comm values('"+id+"','"+name+"','"+prepTime);
               out.println("<h1 color='red'><center>購買商品刪除!</center></h1>");
               conn.close();
               }
               catch(Exception e)
               {
               System.out.print(e);
               e.printStackTrace();
               }
       %>
    </div>
</body>
</html>
