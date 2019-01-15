
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="mywritefile" %>
<%-- 
    Document   : index
    Created on : 2017-11-28, 16:57:19
    Author     : dahua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/style.css" type="text/css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page  </title>
    </head>
    <body>  
        <%!
            int drmpeople[] = {0,0,0,0,0,0,0,0,0};
        %>
        
        <%
        String Dir ="D:\\";
        String FName ="drmdata1.txt";
        String Con = "this is a drm analysis txt \r\n";
        %>
        
           <script type="text/javascript">
            function handlerchangeday(e)
            {
               var subs = document.getElementById("sub");
               var times = document.getElementById("dadn");
               var daynums = document.getElementById("cal").value;
               times.value = daynums;     
               
               document.getElementById("lima").value = 0;
               document.getElementById("liba").value = 0;
               document.getElementById("liwo").value = 0;
               document.getElementById("lijun").value = 0;
               document.getElementById("lihao").value = 0;
               document.getElementById("lilp").value = 0;
               document.getElementById("litx").value = 0;
               document.getElementById("lits").value = 0;
               document.getElementById("lims").value = 0;
               
               
               
            }
            function deliverydata()
            {
                    //     var xmlhttp;
                    //     xmlhttp = new XMLHttpRequest();
                    //     xmlhttp.open("GET", "./index.jsp",true);
                    //     xmlhttp.send();
            }
            function givedata(e)
            {
                   var times = document.getElementById("dadn").value;
            }
            
            function confirmma()
            {
               document.getElementById("lima").value = 1;
               this.disabled = true;
            }
            function confirmba()
            {
                document.getElementById("liba").value = 1;
                this.disabled = true;
            }
            function confirmwo()
            {
                document.getElementById("liwo").value = 1;
                this.disabled = true;
            }
            function confirmjun()
            {
                document.getElementById("lijun").value = 1;
                this.disabled = true;
            }
            function confirmhao()
            {
                document.getElementById("lihao").value = 1;
                this.disabled = true;
            }
            function confirmlp()
            {
                document.getElementById("lilp").value = 1;
                this.disabled = true;
            }
            function confirmtx()
            {
                document.getElementById("litx").value = 1;
                this.disabled = true;
            }
            function confirmts()
            {
                document.getElementById("lits").value = 1;
                this.disabled = true;
            }
            function confirmms()
            {
                document.getElementById("lims").value = 1;
                this.disabled = true;
            }
            
            </script>
            

   
        <h1>DRM Count!</h1>
        <span>日期：</span><input type="date" id="cal" name="caldate"    onchange="handlerchangeday(event);"  max="2019-12-11" min="2010-01-01" style="width:331px"/>
        <br><br>
    
        
        <button type="submit" id="subbutton" onClick="this.disabled = true;"    >Submit</button>
        
         <!--   <button type="button" id="dev" onClick="deliverydata()"    >delivery</button> -->
         
         <%
            
            if(true)
            {
                out.println("going to write file");
                //      out.println("<br>" + "file folder" + Dir);
                //      out.println("<br> file name:" + FName);
            }
            else
            {
                //     out.println("file wire fail!");
            }

         %>

         <br/>
         <hr/>
         
        <form name="name_input_form" action="response.jsp">
            Selected Date:
            <input type="text" name="strfoo" id="dadn"   value="" />
            <br/>
            <br/>
             <ol type="I">
                 <li ><input type="text" name="drmpeople0" id="lima" value=<%=drmpeople[0] %> /></li>
                 <li ><input type="text" name="drmpeople1" id="liba" value=<%=drmpeople[1] %> /></li>
                 <li ><input type="text" name="drmpeople2" id="liwo" value=<%=drmpeople[2] %> /></li>
                 <li ><input type="text" name="drmpeople3" id="lijun" value=<%=drmpeople[3] %> /></li>
                 <li ><input type="text" name="drmpeople4" id="lihao" value=<%=drmpeople[4] %> /></li>
                 <li ><input type="text" name="drmpeople5" id="lilp" value=<%=drmpeople[5] %> /></li>
                 <li ><input type="text" name="drmpeople6" id="litx" value=<%=drmpeople[6] %> /></li>
                 <li ><input type="text" name="drmpeople7" id="lits" value=<%=drmpeople[7] %> /></li>
                 <li ><input type="text" name="drmpeople8" id="lims" value=<%=drmpeople[8] %> /></li>

             </ol>
             
            <button type="button" id="ma" onClick="confirmma()" > Ma </button>
            <button type="button" id="ba" onClick="confirmba()" > Ba </button>
            <button type="button" id="wo" onClick="confirmwo()" > Wo </button>
            <button type="button" id="jun" onClick="confirmjun()" > Jun </button>
            <button type="button" id="hao" onClick="confirmhao()" > Hao </button>
            <button type="button" id="lp" onClick="confirmlp()" > LP </button>
            <button type="button" id="tx" onClick="confirmtx()" > TX </button>
            <button type="button" id="ts" onClick="confirmts()" > TS </button>
            <button type="button" id="ms" onClick="confirmms()" > MS </button>
            <br/>
            <br/>
            Enter your gender:
            <input type="text" name="daynum"  id ="dn" value="13" />

            <input type="submit" value="OK"  onClick="givedata(event)"  name="submit" />
        </form>

    </body>
</html>
