<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@  page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品資訊</title>
</head>
<body>
<%! 
        String user = "root"; 
        String pass = "12345"; 
        String url = "jdbc:mysql://localhost:3306/comm1?useUnicode=true&characterEncoding=UTF-8"; 
        Connection conn; 
        Statement stmt; 
    %> 
    <% 
        try{ 
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
                conn = DriverManager.getConnection(url,user,pass); 
               stmt = conn.createStatement();
                    
        }catch(SQLException sqlex){ 
            out.println("SQL Exception : " + sqlex); 
        } 
    %>
</body>
</html>