<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" 
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1-strict.dtd">

<html xmlns="http://ww.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="js/ext-all.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>        
    <script type="text/javascript" src="js/ext-lang-zh_CN.js"></script>
    <link href="ext-theme-classic/ext-theme-classic-all.css" rel="stylesheet" type="text/css" >
    <script type="text/javascript" src="M.index.jsp"></script>
    
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
<script src="http://maps.google.com/maps?file=api&v=1" type="text/javascript">



function myrefresh()
{
   window.location.reload();
}
setTimeout('myrefresh()',1000); 



</script>
<meta charset="utf-8">
<title>溫濕度紀錄/商品</title>
</head>
<body>
<div style='background-color:pink;width:100%'>
<div class='marquee'>
<h1>溫濕度商品資料</h1><br/>
</div>
</div>

<%
out.println("<style>table {width: 100%;}</style>");
out.println("<style>div{text-align:justify;-moz-text-align-last:center;text-align-last:center;}</style>");
out.println("<style>.marquee{overflow-x:-webkit-marquee;-webkit-marquee-direction:backwards;-webkit-marquee-style:scroll;-webkit-marquee-speed:slow;-webkit-marquee-repetition:infinite;}</style>");
out.println("<div class='marquee' style='background-color:orange;width:100%'>");
out.println("<h1 style='width:100%'>選擇商品</h1>");
out.println("</div>");

%>
<p>
<script>

Ext.onReady(function(){
	Ext.MessageBox.confirm("提示","门票修改成功！",function(btn1){ 
		window.win.close();}) 

	Ext.get("btn1").on("click", function () {
        Ext.Ajax.request({
              url: '/index.jsp',
              params: { a: 10, b: 20 },
              method: 'POST',
              success: function (response, options) {
                  Ext.MessageBox.alert('成功', response.responseText);
              },
              failure: function (response, options) {
                  Ext.MessageBox.alert('失败', '请求超时或网络故障，错误编号：' + response.status);
              }
          });			
	});
});

</script>
<%  
    //驅動程式名  
    String driverName = "com.mysql.cj.jdbc.Driver";  
    //資料庫使用者名稱  
    String userName = "root";  
    //密碼  
    String userPasswd = "123456";  
    //資料庫名  
    String dbName = "temp";
    String tableName = "temp";
   
    
    //聯結字串  
    String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;  
  
    //載入驅動  
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();  
    //建立連線  
    Connection conn = DriverManager.getConnection(url);     

    //建立Statement（負責執行sql語句）  
    Statement stmt = conn.createStatement();  
   
    String sql="select * from temp where temperature<50&&temperature>31.90;";  
    
    
    //獲得資料結果集合  
    ResultSet rs = stmt.executeQuery(sql);  
    
    out.println("<li><a href='/M/pic/insert1.jsp' target='_top'>Egg Benedict</a></li>");
    out.println("<li><a href='/M/pic/insert2.jsp' target='_top'>Mushroom Risotto</a></li>");
    out.println("<li><a href='/M/pic/insert3.jsp' target='_top'>Full Breakfast</a></li>");
    out.println("<li><a href='/M/pic/insert5.jsp' target='_top'>Ham_and_Egg_Sandwitch</a></li>");
    out.println("<li><a href='/M/pic/delete.jsp' target='_top'><b>delete the goods</b></a></li>");
    
    out.println("<style>table {width: 100%;}</style>");
    out.println("<style>div{text-align:justify;-moz-text-align-last:center;text-align-last:center;}</style>");
    out.println("<style>.marquee{overflow-x:-webkit-marquee;-webkit-marquee-direction:backwards;-webkit-marquee-style:scroll;-webkit-marquee-speed:slow;-webkit-marquee-repetition:infinite;}</style>");
    out.println("<div class='marquee' style='background-color:orange;width:100%'>");
    out.println("<h1 style='width:100%'>溫濕度資料</h1>");
    out.println("</div>");
    //依次遍歷結果集（表中的記錄）  
    out.println("<p><center><table><colgroup span='3' style='background-color: yellow;'></colgroup><tr bgcolor='#FF44FF'><th bgcolor='#FF44FF'>id</th><th bgcolor='#FF44FF'>溫度</th><th bgcolor='#FF44FF'>濕度</th></tr>");
    while(rs.next())  
    {   
    	
    	out.println("<tr>");
        //依據資料庫中的欄位名列印資料  
        out.println("<th>");
        out.println(rs.getString("timStamp")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rs.getString("temperature")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rs.getString("humidity")); 
        out.println("</th>");
        out.println("</tr>");
        
       
    }  
    out.println("</table></center></p>");
    String dbNameC = "commodity";
    String tableNameC = "comm"; 
    String urlC = "jdbc:mysql://localhost/" + dbNameC + "?user=" + userName + "&password=" + userPasswd;  
    Connection connC = DriverManager.getConnection(urlC);     
    Statement stmtC = connC.createStatement();  
    String sql3 = "insert into comm values (15,'MushroomRisotto','25min');";
    String sql2="select * from " + tableNameC;  
    ResultSet rsC = stmtC.executeQuery(sql2);  
    out.println("<style>div{text-align:justify;-moz-text-align-last:center;text-align-last:center;}</style>");
    out.println("<style>.marquee{overflow-x:-webkit-marquee;-webkit-marquee-direction:backwards;-webkit-marquee-style:scroll;-webkit-marquee-speed:slow;-webkit-marquee-repetition:infinite;}</style>");
    
    
    
    out.println("<div class='marquee' style='background-color:orange;width:100%'>");
    out.println("<h1 style='width:100%'>商品列表</h1>");
    out.println("</div>");
    //依次遍歷結果集（表中的記錄）  
    out.println("<p><center><table><colgroup span='3' style='background-color: yellow;'></colgroup><tr bgcolor='#FF44FF'><th bgcolor='#FF44FF'>id</th><th bgcolor='#FF44FF'>商品名稱</th><th bgcolor='#FF44FF'>準備時間</th></tr>");
    while(rsC.next())  
    {   
    	
    	out.println("<tr>");
        //依據資料庫中的欄位名列印資料  
        out.println("<th>");
        out.println(rsC.getString("id")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rsC.getString("name")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rsC.getString("prepTime")); 
        out.println("</th>");
        out.print("<th>");
        out.print("<a href='/M/pic/delete2.jsp?id="+rsC.getString("id")+"' target='_top'>刪除</a>");
        out.print("</th>);
        out.println("</tr>");
        
       
    }  
    out.println("</table></center></p>");
    //關閉連線  
    rsC.close();  
    stmtC.close();  
    connC.close();  
    %>
  </p>
  </script>
  
</body>
</html>