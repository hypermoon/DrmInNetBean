<%-- 
    Document   : response
    Created on : 2017-11-28, 17:15:42
    Author     : dahua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mypackage.hello.datatimes" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="mywritefile" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="myreadfile" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.jsp.JspContext" %>


<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <style>
            /* css 代码  */
        </style>
        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    </head>

    <body>
        <%
             String Dir ;
            int islinux = 0;
            if(System.getProperty("os.name").toLowerCase().indexOf("linux") >=0  )
            {
                    islinux = 1;
                    Dir ="/usr/local/ansonfd/";
            }else
            {
                    islinux = 0;
                    Dir ="D:\\";
            }
        
       
         
        String FName ="drmdata1.txt";
        String Con = "this is a drm analysis txt \r\n";
        %>

     <div id="container" style="min-width:400px;height:400px"></div>
        
      <%! int mydd =321; String strdata; String validinput; int isvalid =1; %>
      <jsp:useBean id="mybean" scope="session" class="org.mypackage.hello.datatimes" />
    
        <jsp:setProperty name="mybean" property="strfoo" />
        <h1>hellos,<jsp:getProperty name="mybean" property="strfoo" /> !</h1>
     
        <jsp:setProperty name="mybean" property="drmpeople0" />
        <h1>hellos2,<jsp:getProperty name="mybean" property="drmpeople0" /> !</h1>
        
        <jsp:setProperty name="mybean" property="drmpeople1" />
        <jsp:setProperty name="mybean" property="drmpeople2" />
        
        <jsp:setProperty name="mybean" property="drmpeople3" />
        <jsp:setProperty name="mybean" property="drmpeople4" />
        <jsp:setProperty name="mybean" property="drmpeople5" />
        
        <jsp:setProperty name="mybean" property="drmpeople6" />
        <jsp:setProperty name="mybean" property="drmpeople7" />
        <jsp:setProperty name="mybean" property="drmpeople8" />

        <%
                             validinput = mybean.getStrfoo();
                             strdata = mybean.getStrfoo();  
               strdata += " | "; 
               
                             strdata += mybean.getDrmpeople0();
               strdata += " "; 
                         
                              strdata += mybean.getDrmpeople1();
               strdata += " "; 
               
                              strdata += mybean.getDrmpeople2();
               strdata += " "; 
               
                              strdata += mybean.getDrmpeople3();
               strdata += " "; 
               
                              strdata += mybean.getDrmpeople4();
               strdata += " "; 
               
                              strdata += mybean.getDrmpeople5();
               strdata += " "; 
               
                              strdata += mybean.getDrmpeople6();
               strdata += " "; 
               
                              strdata += mybean.getDrmpeople7();
               strdata += " "; 
               
                              strdata += mybean.getDrmpeople8();
               strdata += " "; 
               
               out.println("-----");
               out.println(strdata);
         %>
         <%  if( validinput ==null || validinput.equals("") )  //empty string
            {
               strdata ="empty";
            }
        
        %>
        
         <mywritefile:MyWriteTag dir="<%=Dir%>" fname="<%=FName%>" con="<%=strdata%>" />
        
        <jsp:setProperty name="mybean" property="daynum" />
         
         <h1>yeap,<jsp:getProperty name="mybean" property="daynum" /> !</h1> 
         <h1>oops,<%=mydd%> !</h1> 

    
         <h1>oops2,<%   org.mypackage.hello.datatimes myob = new org.mypackage.hello.datatimes() ;
                        myob.setDaynum(17);
                        mydd = myob.getDaynum();
                        out.println(mydd);
                        
                        request.setAttribute("test", mybean.getDaynum() );
                    %> !
                    
               <input type="hidden" id="bb" value="ggs" >

          </h1>
                    
                    <%
                        //String filePath="D:\\";
                        String filePath  =   Dir;
                        String fileName="drmdata1.txt";
                     %>
         <myreadfile:MyReadTag fdir="<%=filePath%>"  fname="<%=fileName%>" />
         
         <%="demo"%>;
         <br/>
         <%! String items; %>
         
          <%-- <myreadfile:MyReadTag  items = "${strshow}"   strshow/> --%>
        
          <% String []items =(String[])request.getAttribute("resultnew");   %>
          
          <% String []itemstimes =(String[])request.getAttribute("resultnewtimes");  %>
        
         <%-- <c:out value="${items}" escapeXml="false" ></c:out>     --%>
         <%=items[0] %>
         <br/>
         <%=items[1] %>
         <br/>
         <%=items[2] %>
         <br/>
  
            
         <%=itemstimes[0] %>
         <br/>
         <%=itemstimes[1] %>
         <br/>
         <%=itemstimes[2] %>
         <br/>
           
        
        <script>
            var yearsize =  "<%= items.length   %>";
            var limaarr = new Array(yearsize);
            var yeararr =  new Array(yearsize);
           
        </script>
        
        <% for(int i = 0 ;i <items.length; i++) { %>
             <script>
                   limaarr[<%= i%>] = "<%= itemstimes[i].substring(0,1) %>";
                  
                   yeararr[<%= i%>] = "<%= items[i]%>";
             </script>
        <%}%>
      
        <script>
            var nums=  document.getElementById("bb").value;   
            var tbs = <%=mybean.getDrmpeople0()%>;
            var serverinfo = <%=request.getAttribute("test")%>;

            var chart = Highcharts.chart('container',{
            chart: {
                type: 'column'
            },
            title: {
                text: 'Drm to every one'
            },
            subtitle: {
                text: '数据来源: WorldClimate.com'
            },
            xAxis: {
                categories: [
                    yeararr[0], yeararr[1],yeararr[2],yeararr[3],yeararr[4],yeararr[5],yeararr[6],yeararr[7],yeararr[8],yeararr[9],yeararr[10],yeararr[11],yeararr[12],yeararr[13],
                    yeararr[14],yeararr[15],yeararr[16],yeararr[17],yeararr[18],yeararr[19],yeararr[20],yeararr[21],yeararr[22],yeararr[23],yeararr[24],yeararr[25],yeararr[26],
                    yeararr[27],yeararr[28],yeararr[29],yeararr[30],yeararr[31],yeararr[32],yeararr[33],yeararr[34],yeararr[35],yeararr[36],yeararr[37],yeararr[38],yeararr[39]
                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Drm NO.'
                }
            },
            tooltip: {
                // head + 每个 point + footer 拼接成完整的 table
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    borderWidth: 0
                }
            },
            series: [{
                name: 'lima',
                data: [parseInt(limaarr[0])*50, parseInt(limaarr[1])*50, parseInt(limaarr[2])*50, parseInt(limaarr[3])*50,
                       parseInt(limaarr[4])*50,parseInt(limaarr[5])*50, parseInt(limaarr[6])*50,
                       parseInt(limaarr[7])*50, parseInt(limaarr[8])*50, parseInt(limaarr[9])*50, parseInt(limaarr[10])*50,
                       parseInt(limaarr[11])*50]
            }, {
                name: 'liba',
                data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
            }, {
                name: 'liwo',
                data: [tbs, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
            }, {
                 name: 'lijun',
                 data: [serverinfo, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
            },{
                 name: 'lihao',
                 data: [35.6, 25.6, 27.9, 28.7, 29.6, 30.5, 31.4, 32.4, 33.6, 34.1, 35.8, 36.1]
            },{
                 name: 'lilp',
                 data: [37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 36.1]
            },{
                 name: 'litx',
                 data: [37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 36.1]
            },{
                 name: 'lits',
                 data: [47.6, 47.6, 47.6, 47.6, 47.6, 47.6, 47.6, 47.6, 47.6, 47.6, 47.6, 36.1]
            },{
                 name: 'lims',
                 data: [57.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 37.6, 36.1]
            }
                 ]
        });
        </script>

              
    </body>
</html>
