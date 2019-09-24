<%-- 
    Document   : MyReadTag
    Created on : 2018-8-28, 15:34:38
    Author     : dahua
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag import="java.io.*" %>
<%-- The list of normal or fragment attributes can be specified here: --%>

<%@tag import="javax.servlet.jsp.JspContext" %>
<%@tag import="javax.servlet.http.HttpServletRequest" %>
<%@tag import="java.util.ArrayList" %>
<%@tag import="java.util.List" %>
<%@attribute name="fdir" required="true" %>
<%@attribute name="fname" required="true" %>
<%!
    public String readContent(HttpServletRequest request, File f)
   {

        List<String> list = new ArrayList<String>();
        List<String> listtimes = new ArrayList<String>();
        StringBuffer str = new StringBuffer();
        try
        {
           FileReader in = new FileReader(f);
           BufferedReader bufferin = new BufferedReader(in);
           String temp;
           String  lntime;
           String[] stryear;
           while((temp=bufferin.readLine())!=null)
           {
                        if(temp.length()>4)
                       {
                          str.append(temp);
                          str.append("<br>");

                          stryear = temp.split("\\|");
                       
                          lntime = temp.substring(13);
                         
                          listtimes.add(lntime.toString());
                         
                          list.add(stryear[0].toString());
                       }
                          
            }
               bufferin.close();
               in.close();
         }
        catch(IOException e)
        {

        }
 
        String[]  alltimes = (String[])listtimes.toArray(new String[0]);
        String[]  allyear = (String[])list.toArray(new String[0]);
        request.setAttribute("resultnew", allyear);
       
        request.setAttribute("resultnewtimes", alltimes);

        return new String(str);

    }
%>
<%
         File f = new File(fdir,fname);
         //String strshow = "123 tt!";
         String []arr = {"aa","bb","cc","dd"};
         String str = readContent(request,f);
         out.println(f.getName() + "'s content:<br>");
         out.print(str);
         //jspContext.setAttribute("result", strshow);
         //request.setAttribute("resultnew", arr);
         // pageContext.setAttribute("result", "aaff");
         
%>