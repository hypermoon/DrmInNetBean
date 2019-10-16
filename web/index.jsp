
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="mywritefile" %>
<%-- 
    Document   : index
    Created on : 2017-11-28, 16:57:19
    Author     : dahua
--%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/style.css" type="text/css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page  </title>
    </head>
    <body  onload="padd()" >  

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
                        Dir = "D:\\drm";
                }

                 File file = new File(Dir);
                 File[] drmfilearray = file.listFiles();
                 
                 String[] fileslist = new String[drmfilearray.length];
                 
                 int bb =0 ;
                 bb= drmfilearray.length;
                 
                 for(int i = 0; i < drmfilearray.length; i++)
                 {
                     if(drmfilearray[i].isFile()){
                         System.out.println(" ----              ---  " );
                         System.out.println("^^^^" + drmfilearray[i].getName());
                         fileslist[i] = drmfilearray[i].getName();
                     }
                 }
                        
                        
                %>
        
           <script type="text/javascript">  // <!-- script start , script to performace user action -->
                var myfilename = new Array();
                
               <%  for(int k =0; k < fileslist.length; k ++){  %>
                        if("<%=fileslist[k]%>" !== null )
                        {
                            myfilename[<%=k%>] = "<%=fileslist[k]%>";
                        }
               <%   } %>
            
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
                function addfile()
                {
                    var len;
                    len = myfilename.length;
                    len = len+1;
                    var newname = "drmdata" + len + ".txt";
                    
                    var selinput = document.getElementById("drmselfile");
                    selinput.value = newname;
                    
                   // var selectdom = document.getElementById("selectid");
                   // selectdom.value = newname;

                }
                function handlerselected(e)
                {
                   var selectdom = document.getElementById("selectid");
                   var index = selectdom.selectedIndex;

                   var selinput = document.getElementById("drmselfile");
                   
                   selinput.value = selectdom.options[index].text;

                }
                function givedata(e)
                {
                   //var times = document.getElementById("dadn").value;
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
            
                function padd(){
                  
                   var selectdom = document.getElementById("selectid");
                   var objoption = document.createElement("option");
                 
                  var selfiledoms = document.getElementById("drmselfile");

                   
                   var len = selectdom.length;
                
                   for(var i = len; i >0; i--){ 
                       selectdom.options[i-1]  = null;
                   }
                   
                   for(var x =0 ;x < myfilename.length; x++ )
                   {                       
                      document.getElementById("selectid").options.add(new Option(myfilename[x], x));
                   }
                   
                                 
                   selfiledoms.value = selectdom.options[0].text;
               }

            
            </script>  <!-- script end -->
            
        <h1>DRM Count!</h1>
        <span>日期：</span><input type="date" id="cal" name="caldate"  onchange="handlerchangeday(event);"  max="2029-12-11" min="2010-01-01" style="width:331px"/>
        <br/>
        <br/>
                      
        <button type="submit" id="subbutton"  disabled="disabled" onClick="this.disabled = true;"    >Confirm_Date</button>
        &nbsp&nbsp
        <select id="selectid"  onchange="handlerselected(event)"  style="width:120px;"  >
         
        </select>&nbsp<button type="button" id="fileadd" onClick="addfile()"    >+</button>
            
         
         
        <%!
            int drmpeople[] = {0,0,0,0,0,0,0,0,0};
        %>

         <br/>
         <hr/>

         
        <form name="name_input_form" action="response.jsp">
         <td>
          <input type="checkbox" name="isDeletefile" value="false">  Delete This File Record
          <hr/>
          <br/>
         </td>
            Selected Date:
            <input type="text" name="strfoo" id="dadn"   value="" /> 
            &nbsp&nbsp
            Selected File:
            <input type="text" name="drmfiles" id="drmselfile"   value= ""   /> 
            <br/>
            <br/>
             <ol type="I">
                 <li ><input type="text" name="drmpeople0" id="lima" value=<%=drmpeople[0] %> /> &nbsp&nbsp <button type="button" id="ma" onClick="confirmma()" >   Ma </button></li>
                 <li ><input type="text" name="drmpeople1" id="liba" value=<%=drmpeople[1] %> /> &nbsp&nbsp <button type="button" id="ba" onClick="confirmba()" >   Ba </button></li>
                 <li ><input type="text" name="drmpeople2" id="liwo" value=<%=drmpeople[2] %> /> &nbsp&nbsp <button type="button" id="wo" onClick="confirmwo()" > Wo </button></li>
                 <li ><input type="text" name="drmpeople3" id="lijun" value=<%=drmpeople[3] %> /> &nbsp&nbsp <button type="button" id="jun" onClick="confirmjun()" > Jun </button></li>
                 <li ><input type="text" name="drmpeople4" id="lihao" value=<%=drmpeople[4] %> /> &nbsp&nbsp <button type="button" id="hao" onClick="confirmhao()" > Hao </button></li>
                 <li ><input type="text" name="drmpeople5" id="lilp" value=<%=drmpeople[5] %> /> &nbsp&nbsp <button type="button" id="lp" onClick="confirmlp()" > LP </button></li>
                 <li ><input type="text" name="drmpeople6" id="litx" value=<%=drmpeople[6] %> /> &nbsp&nbsp <button type="button" id="tx" onClick="confirmtx()" > TX </button></li>
                 <li ><input type="text" name="drmpeople7" id="lits" value=<%=drmpeople[7] %> /> &nbsp&nbsp <button type="button" id="ts" onClick="confirmts()" > TS </button></li>
                 <li ><input type="text" name="drmpeople8" id="lims" value=<%=drmpeople[8] %> /> &nbsp&nbsp <button type="button" id="ms" onClick="confirmms()" > MS </button></li>

             </ol>
            <br/>
            <br/>
            Enter your gender:
            
            <input type="text" name="daynum"  id ="dn" value="" />
            <input type="submit" value="OK"  onClick="givedata(event)"  name="submit" />
        </form>

    </body>
</html>
