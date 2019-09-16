<%-- 
    Document   : response
    Created on : 2017-11-28, 17:15:42
    Author     : dahua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mypackage.hello.datatimes" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.jsp.JspContext" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="mywritefile" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="myreadfile" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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
            String Dir;
            int islinux = 0;
                if(System.getProperty("os.name").toLowerCase().indexOf("linux") >=0  )
                {
                        islinux = 1;
                        Dir = "/usr/local/ansonfd/";
                }else
                {
                        islinux = 0;
                        Dir = "D:\\";
                }


            String FName ="drmdata1.txt";
            String Con = "this is a drm analysis txt \r\n";




             String fpname; 
             fpname = Dir + FName;
             File f = new File(fpname);

             boolean  flagok = false;
             boolean  delflag ;

             String[] chk = request.getParameterValues("isDeletefile");

             if(chk != null)
             {
                   delflag = true;
                   out.println("File deleted!");  
             }
             else   
             {
                  delflag = false;
                  out.println("File remains.");  
             }


             if(f.exists())
            {

                if(delflag)
                {
                   flagok  = f.delete();

                   if(flagok)
                        out.println("success");
                   else
                        out.println("file cannot delete");
                }

             }
        %>
        
        
       
     <div id="container" style="min-width:400px;height:400px"></div>
        
      <%! int mydd =321; String strdata; String validinput; int isvalid =1; %>
      <jsp:useBean id="mybean" scope="page" class="org.mypackage.hello.datatimes" />     <%--  set scope to page to avoid bean restore bug --%>
    
        <jsp:setProperty name="mybean" property="strfoo" />
        <h1>Date:<jsp:getProperty name="mybean" property="strfoo" /> !</h1>
     
        <button type="submit" id="subbutton" onClick= "gobacks()" >Goback</button>
       
        <h1>drm2,<jsp:getProperty name="mybean" property="drmpeople0" /> !</h1>
              
        <jsp:setProperty name="mybean" property="drmpeople0" />
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
               
              if( validinput == null || validinput.equals("") )  //empty string
              {
                  strdata ="empty";
              }
         %>

        
         <mywritefile:MyWriteTag dir="<%=Dir%>" fname="<%=FName%>" con="<%=strdata%>" />
        
        <jsp:setProperty name="mybean" property="daynum" />
         
         <h1>yeap,<jsp:getProperty name="mybean" property="daynum" /> !</h1> 
       

         <h1>oops2, netbean output:
                      <%   org.mypackage.hello.datatimes myob = new org.mypackage.hello.datatimes() ;
                        myob.setDaynum(17);
                        mydd = myob.getDaynum();
                        out.println(mydd);
                        
                        request.setAttribute("test", mybean.getDaynum() );
                       %> !
                    
               <input type="hidden" id="bb" value="ggs" >

          </h1>
                    
                    <%
                        //String filePath="D:\\";
                        String filePath=   Dir;        //".\\";
                        String fileName="drmdata1.txt";
                     %>
         <myreadfile:MyReadTag fdir="<%=filePath%>"  fname="<%=fileName%>" />
         
         <hr/>
         <br/>
         <%="Out put End token"%>;
         <br/>
         <%! String items; %>
         
          <%-- <myreadfile:MyReadTag  items = "${strshow}"   strshow/> --%>
        
          <% String []items =(String[])request.getAttribute("resultnew");   %>
          
          <% String []itemstimes =(String[])request.getAttribute("resultnewtimes");  %>
        

        <script>
            var yearsize =  "<%= items.length   %>";
            var limaarr = new Array(yearsize);
            var libaarr = new Array(yearsize);
            var liwoarr = new Array(yearsize);
            var lijunarr = new Array(yearsize);
              
            var lihaoarr = new Array(yearsize);
               
            var lilparr = new Array(yearsize);
            var litxarr = new Array(yearsize);
            var litsarr = new Array(yearsize);
            var limsarr = new Array(yearsize);
              
            var yeararr =  new Array(yearsize);
            
            
            var all_lima=0;
            var all_liba=0;
            var all_liwo=0;
            var all_lijun=0;
            var all_lihao=0;
            var all_lilp=0;
            var all_litx=0;
            var all_lits=0;
            var all_lims=0;
            var all_pep=0;
           
        </script>
        
        <% for(int i = 0 ;i <items.length; i++) { %>
             <script>
                   limaarr[<%= i%>] = "<%= itemstimes[i].substring(0,1) %>";
                   libaarr[<%= i%>] = "<%= itemstimes[i].substring(2,3) %>";
                   liwoarr[<%= i%>] = "<%= itemstimes[i].substring(4,5) %>";
                   lijunarr[<%= i%>] = "<%= itemstimes[i].substring(6,7) %>";
                   lihaoarr[<%= i%>] = "<%= itemstimes[i].substring(8,9) %>";
                   lilparr[<%= i%>] = "<%= itemstimes[i].substring(10,11) %>";
                   litxarr[<%= i%>] = "<%= itemstimes[i].substring(12,13) %>";
                   litsarr[<%= i%>] = "<%= itemstimes[i].substring(14,15) %>";
                   limsarr[<%= i%>] = "<%= itemstimes[i].substring(16,17) %>";
                   
                   yeararr[<%= i%>] = "<%= items[i]%>";
                   
                   
                   if(parseInt(limaarr[<%= i%>])=== 1)
                      all_lima++;
                   if(parseInt(libaarr[<%= i%>])=== 1)
                      all_liba++;
                   if(parseInt(liwoarr[<%= i%>])=== 1)
                      all_liwo++;
                   if(parseInt(lijunarr[<%= i%>])=== 1)
                      all_lijun++;
                      
                   if(parseInt(lihaoarr[<%= i%>])=== 1)
                      all_lihao++;
                   if(parseInt(lilparr[<%= i%>])=== 1)
                      all_lilp++;
                   if(parseInt(litxarr[<%= i%>])=== 1)
                      all_litx++;
                   if(parseInt(litsarr[<%= i%>])=== 1)
                      all_lits++;
                   if(parseInt(limsarr[<%= i%>])=== 1)
                      all_lims++;
                 
                   //alert(all_lima);
                   
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
                       parseInt(limaarr[4])*50,parseInt(limaarr[5])*50, parseInt(limaarr[6])*50,  parseInt(limaarr[7])*50,
                       parseInt(limaarr[8])*50, parseInt(limaarr[9])*50, parseInt(limaarr[10])*50,parseInt(limaarr[11])*50,
                       parseInt(limaarr[12])*50, parseInt(limaarr[13])*50, parseInt(limaarr[14])*50,parseInt(limaarr[15])*50,
                       parseInt(limaarr[16])*50, parseInt(limaarr[17])*50, parseInt(limaarr[18])*50,parseInt(limaarr[19])*50,
                       parseInt(limaarr[20])*50, parseInt(limaarr[21])*50, parseInt(limaarr[22])*50,parseInt(limaarr[23])*50]
            }, {
                name: 'liba',
                data: [parseInt(libaarr[0])*50, parseInt(libaarr[1])*50, parseInt(libaarr[2])*50, parseInt(libaarr[3])*50,
                       parseInt(libaarr[4])*50,parseInt(libaarr[5])*50, parseInt(libaarr[6])*50,  parseInt(libaarr[7])*50,
                       parseInt(libaarr[8])*50, parseInt(libaarr[9])*50, parseInt(libaarr[10])*50,parseInt(libaarr[11])*50,
                       parseInt(libaarr[12])*50, parseInt(libaarr[13])*50, parseInt(libaarr[14])*50,parseInt(libaarr[15])*50,
                       parseInt(libaarr[16])*50, parseInt(libaarr[17])*50, parseInt(libaarr[18])*50,parseInt(libaarr[19])*50,
                       parseInt(libaarr[20])*50, parseInt(libaarr[21])*50, parseInt(libaarr[22])*50,parseInt(libaarr[23])*50]
            }, {
                name: 'liwo',
                data: [parseInt(liwoarr[0])*50, parseInt(liwoarr[1])*50, parseInt(liwoarr[2])*50, parseInt(liwoarr[3])*50,
                       parseInt(liwoarr[4])*50,parseInt(liwoarr[5])*50, parseInt(liwoarr[6])*50,  parseInt(liwoarr[7])*50,
                       parseInt(liwoarr[8])*50, parseInt(liwoarr[9])*50, parseInt(liwoarr[10])*50,parseInt(liwoarr[11])*50,
                       parseInt(liwoarr[12])*50, parseInt(liwoarr[13])*50, parseInt(liwoarr[14])*50,parseInt(liwoarr[15])*50,
                       parseInt(liwoarr[16])*50, parseInt(liwoarr[17])*50, parseInt(liwoarr[18])*50,parseInt(liwoarr[19])*50,
                       parseInt(liwoarr[20])*50, parseInt(liwoarr[21])*50, parseInt(liwoarr[22])*50,parseInt(liwoarr[23])*50]
            }, {
                 name: 'lijun',
                 data: [parseInt(lijunarr[0])*50, parseInt(lijunarr[1])*50, parseInt(lijunarr[2])*50, parseInt(lijunarr[3])*50,
                       parseInt(lijunarr[4])*50,parseInt(lijunarr[5])*50, parseInt(lijunarr[6])*50,  parseInt(lijunarr[7])*50,
                       parseInt(lijunarr[8])*50, parseInt(lijunarr[9])*50, parseInt(lijunarr[10])*50,parseInt(lijunarr[11])*50,
                       parseInt(lijunarr[12])*50, parseInt(lijunarr[13])*50, parseInt(lijunarr[14])*50,parseInt(lijunarr[15])*50,
                       parseInt(lijunarr[16])*50, parseInt(lijunarr[17])*50, parseInt(lijunarr[18])*50,parseInt(lijunarr[19])*50,
                       parseInt(lijunarr[20])*50, parseInt(lijunarr[21])*50, parseInt(lijunarr[22])*50,parseInt(lijunarr[23])*50]
            },{
                 name: 'lihao',
                 data: [parseInt(lihaoarr[0])*50, parseInt(lihaoarr[1])*50, parseInt(lihaoarr[2])*50, parseInt(lihaoarr[3])*50,
                       parseInt(lihaoarr[4])*50,parseInt(lihaoarr[5])*50, parseInt(lihaoarr[6])*50,  parseInt(lihaoarr[7])*50,
                       parseInt(lihaoarr[8])*50, parseInt(lihaoarr[9])*50, parseInt(lihaoarr[10])*50,parseInt(lihaoarr[11])*50,
                       parseInt(lihaoarr[12])*50, parseInt(lihaoarr[13])*50, parseInt(lihaoarr[14])*50,parseInt(lihaoarr[15])*50,
                       parseInt(lihaoarr[16])*50, parseInt(lihaoarr[17])*50, parseInt(lihaoarr[18])*50,parseInt(lihaoarr[19])*50,
                       parseInt(lihaoarr[20])*50, parseInt(lihaoarr[21])*50, parseInt(lihaoarr[22])*50,parseInt(lihaoarr[23])*50]
            },{
                 name: 'lilp',
                 data: [parseInt(lilparr[0])*50, parseInt(lilparr[1])*50, parseInt(lilparr[2])*50, parseInt(lilparr[3])*50,
                       parseInt(lilparr[4])*50,parseInt(lilparr[5])*50, parseInt(lilparr[6])*50,  parseInt(lilparr[7])*50,
                       parseInt(lilparr[8])*50, parseInt(lilparr[9])*50, parseInt(lilparr[10])*50,parseInt(lilparr[11])*50,
                       parseInt(lilparr[12])*50, parseInt(lilparr[13])*50, parseInt(lilparr[14])*50,parseInt(lilparr[15])*50,
                       parseInt(lilparr[16])*50, parseInt(lilparr[17])*50, parseInt(lilparr[18])*50,parseInt(lilparr[19])*50,
                       parseInt(lilparr[20])*50, parseInt(lilparr[21])*50, parseInt(lilparr[22])*50,parseInt(lilparr[23])*50]
            },{
                 name: 'litx',
                 data: [parseInt(litxarr[0])*50, parseInt(litxarr[1])*50, parseInt(litxarr[2])*50, parseInt(litxarr[3])*50,
                       parseInt(litxarr[4])*50,parseInt(litxarr[5])*50, parseInt(litxarr[6])*50,  parseInt(litxarr[7])*50,
                       parseInt(litxarr[8])*50, parseInt(litxarr[9])*50, parseInt(litxarr[10])*50,parseInt(litxarr[11])*50,
                       parseInt(litxarr[12])*50, parseInt(litxarr[13])*50, parseInt(litxarr[14])*50,parseInt(litxarr[15])*50,
                       parseInt(litxarr[16])*50, parseInt(litxarr[17])*50, parseInt(litxarr[18])*50,parseInt(litxarr[19])*50,
                       parseInt(litxarr[20])*50, parseInt(litxarr[21])*50, parseInt(litxarr[22])*50,parseInt(litxarr[23])*50]
            },{
                 name: 'lits',
                 data: [parseInt(litsarr[0])*50, parseInt(litsarr[1])*50, parseInt(litsarr[2])*50, parseInt(litsarr[3])*50,
                       parseInt(litsarr[4])*50,parseInt(litsarr[5])*50, parseInt(litsarr[6])*50,  parseInt(litsarr[7])*50,
                       parseInt(litsarr[8])*50, parseInt(litsarr[9])*50, parseInt(litsarr[10])*50,parseInt(litsarr[11])*50,
                       parseInt(litsarr[12])*50, parseInt(litsarr[13])*50, parseInt(litsarr[14])*50,parseInt(litsarr[15])*50,
                       parseInt(litsarr[16])*50, parseInt(litsarr[17])*50, parseInt(litsarr[18])*50,parseInt(litsarr[19])*50,
                       parseInt(litsarr[20])*50, parseInt(litsarr[21])*50, parseInt(litsarr[22])*50,parseInt(litsarr[23])*50]
            },{
                 name: 'lims',
                 data: [parseInt(limsarr[0])*50, parseInt(limsarr[1])*50, parseInt(limsarr[2])*50, parseInt(limsarr[3])*50,
                       parseInt(limsarr[4])*50,parseInt(limsarr[5])*50, parseInt(limsarr[6])*50,  parseInt(limsarr[7])*50,
                       parseInt(limsarr[8])*50, parseInt(limsarr[9])*50, parseInt(limsarr[10])*50,parseInt(limsarr[11])*50,
                       parseInt(limsarr[12])*50, parseInt(limsarr[13])*50, parseInt(limsarr[14])*50,parseInt(limsarr[15])*50,
                       parseInt(limsarr[16])*50, parseInt(limsarr[17])*50, parseInt(limsarr[18])*50,parseInt(limsarr[19])*50,
                       parseInt(limsarr[20])*50, parseInt(limsarr[21])*50, parseInt(limsarr[22])*50,parseInt(limsarr[23])*50]
            }
                 ]
        });
        

            
        
                all_pep = all_lima + all_liba + all_liwo + all_lijun + all_lihao + all_lilp + all_litx + all_lits +all_lims;
                
                var  ma_pep  =  all_lima/all_pep;
                var  ba_pep  = all_liba/all_pep;
                var  wo_pep  = all_liwo/all_pep;
                var  jun_pep = all_lijun/all_pep;
                var  hao_pep = all_lihao/all_pep;
                var  lp_pep  = all_lilp/all_pep;
                var  tx_pep  = all_litx/all_pep;
                var  ts_pep  = all_lits/all_pep;
                var  ms_pep  = all_lims/all_pep;
                
                 ma_pep.toFixed(2);
                 ba_pep.toFixed(2);
                 wo_pep.toFixed(2);
                 jun_pep.toFixed(2);
                 hao_pep.toFixed(2);
                 lp_pep.toFixed(2);
                 tx_pep.toFixed(2);
                 ts_pep.toFixed(2);
                 ms_pep.toFixed(2);
                 
                 
                 //ma_pep.toPrecision(2);
      
                 //alert(ff.toFixed(2));
        
                Highcharts.chart('container', {
                chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                },
                title: {
                        text: '2018年1月浏览器市场份额'
                },
                tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                        pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        style: {
                                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                }
                        }
                },
                series: [{
                        name: 'Brands',
                        colorByPoint: true,
                        data: [{
                                name: 'Chrome',
                                y:   ma_pep,
                                sliced: true,
                                selected: true
                        }, {
                                name: 'Internet Explorer',
                                y: ba_pep
                        }, {
                                name: 'Firefox',
                                y:  wo_pep
                        }, {
                                name: 'Edge',
                                y:  jun_pep
                        }, {
                                name: 'Safari',
                                y:  hao_pep
                        }, {
                                name: 'Sogou Explorer',
                                y:  lp_pep
                        }, {
                                name: 'Opera',
                                y:   tx_pep
                        }, {
                                name: 'QQ',
                                y:   ts_pep
                        }, {
                                name: 'Other',
                                y:  ms_pep
                        }]
                }]
        });
        
        
                        function gobacks()
                       {
                        //                alert("ahaa");
                         var hostname=window.location.host;
                         var protocol = window.location.protocol;
                         window.location = "index.jsp";
                      }

                      
        </script>
        
        
        

              
    </body>
</html>
