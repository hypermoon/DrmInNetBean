<%-- 
    Document   : MyWriteTag
    Created on : 2018-8-28, 14:54:21
    Author     : dahua
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag import="java.io.*" %>
<%@attribute name="dir" required="true" %>
<%@attribute name="fname" required="true" %>
<%@attribute name="con" required="true" %> 

<%@variable name-given="result" variable-class="java.lang.Boolean" scope="AT_END" %>


<%!
public void writeContent(String str, File f)
{
    if(con.equals("empty") )
   {
      return;
    }

    try
    {
          FileWriter outfile = new FileWriter(f,true);
          BufferedWriter bufferout = new BufferedWriter(outfile);
          bufferout.write(str);
          bufferout.close();
          outfile.close();
    }
    catch(IOException e)
    {

    }
}

%>
<%
     boolean flag = false;
     File f = new File(dir,fname);
     if(con.length()>0 )
     {
         writeContent(con,f);
     }
     
     writeContent("\r\n",f);
     flag = true;
    // jspContext.setAttribute("result", new Boolean(flag));
%>

<%-- any content can be specified here e.g.: --%>
