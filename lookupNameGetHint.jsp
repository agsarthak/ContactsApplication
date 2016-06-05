<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%!
	String PREFIX = "session.login";
	String ACCOUNT = PREFIX + ".account";
%>

<%
   Object accountObject = session.getValue(ACCOUNT);
		
			if (accountObject == null)
				throw new RuntimeException("You need to log in to use this service!");
				
			if (!(accountObject instanceof Hashtable))
				throw new RuntimeException("You need to log in to use this service!");
				
			Hashtable account = (Hashtable) accountObject;
			
			String userName = (String) account.get("name");
		      
      Connection con = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      String lookupName = request.getParameter("LookupMemberName");
      

   
   try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
     
     stmt = con.createStatement();
     rs = stmt.executeQuery("SELECT username FROM userstable");
	
    response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache");

    // Fill up vector with names
    Vector names = new Vector();

    while(rs.next()){
    String user = rs.getString("UserName");
    names.add(user);
    }




String hint="";

//get the q parameter from URL
String q = request.getParameter("q");

//lookup all hints from array if length of q>0
if (q.length() > 0)
{
  
  for(int i=0; i < names.size(); i++)
  {
	String current = (String) names.elementAt(i);
	
  if ( current.regionMatches(true, 0, q, 0, q.length()))
    {
    if (hint=="")
      {
      hint=(String)names.elementAt(i);
      }
    else
      {
      hint = hint + " <BR></names.size(> " + (String) names.elementAt(i);
      }
    }
  }
}

// Set output to "no suggestion" if no hint were found
// or to the correct values
String res;
if (hint.equals(""))
{
 res = "no suggestion";
}
else
{
 res=hint;
}

//output the response
out.println(res);
} 
catch (Exception e) {
         out.println("Could not connect to the users database.<P>");
         out.println("The error message was");
         out.println("<PRE>");
         out.println(e.getMessage());
         out.println("</PRE>");
      }
%>