<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%!
	String PREFIX = "session.login";
	String ACCOUNT = PREFIX + ".account";
%>
<%
		try
		{
			Object accountObject = session.getValue(ACCOUNT);
			
			// If no account object was put in the session, or
			// if one exists but it is not a hashtable, then
			// redirect the user to the original login page
			
			if (accountObject == null)
				throw new RuntimeException("You need to log in to use this service!");
				
			if (!(accountObject instanceof Hashtable))
				throw new RuntimeException("You need to log in to use this service!");
				
			Hashtable account = (Hashtable) accountObject;
			
			String userName = (String) account.get("name");
%>

   
	<html>
	<head>
	<title>User Messages for <%=userName%></title>
	    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        
        <script src="lookupNameClientHint.js"></script>
        
        <link rel="stylesheet" href="loggedin.css" type="text/css">
	</head>
<body>
        
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll">XYZ Online Dating</a>

                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"> My Account<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="details.jsp?type=2&data=<%=userName%>" target="_blank">View details</a></li>
<!--                                    <li><a href="update.jsp" target="_blank">Update Information</a></li>-->
                                    <li><a href="viewContacts.jsp" target="_blank">View Contacts</a></li>
                                    <li><a href="change.jsp" target="_blank">Change Password</a></li>
                                </ul>
                        </li>
                        <li>
                            <a class="page-scroll" href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        
        <header id="header2">
                <div class="header-content2">
                    <div class="header-content-inner2">
                        <h1>Welcome <%=userName%></h1>
                        <p></p>
                    </div>
                </div>
                      
    <script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
   </script>
<script>
         $(document).ready(function(){
             $("#dialog").dialog({
            autoOpen: true,
            position: 'center' ,
            title: 'EDIT',
            draggable: false,
            width : 300,
            height : 40, 
            resizable : false,
            modal : true,
                });
    
            $("#reply").click( function() {
            $("#dialog").load('path/to/file.html', function() {
                $("#dialog").dialog("open");
            });
                });
         });
         
         
               
    
    
//                    $(document).load(function () {
//                        $("#reply").click(function () {
//                            $("#thedialog").attr('src', $(this).attr("href"));
//                            $("#somediv").dialog({
//                                width: 400,
//                                height: 450,
//                                modal: true
//                            });
//                            return false;
//                        });
//                    });
</script>
    <CENTER>


<%
      Connection con = null;
      Statement stmt = null;
      ResultSet rs = null;
      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
         
         stmt = con.createStatement();
         rs = stmt.executeQuery("SELECT * FROM messages WHERE userName='" + userName + "' ORDER BY messageID");
    %>

         
		<form name='deleteMessagesForm' method='post' action='delete.jsp'>-->
		<TABLE BGCOLOR='#EFEFFF' CELLPADDING='2' CELLSPACING='4' BORDER='1'>
		<TR>
		<TH ALIGN='center'><B>Message ID</B></TH>
		<TH ALIGN='center'><B>From User</B></TH>
		<TH ALIGN='center'><B>Message</B></TH>
		<TH ALIGN='center'><B>Date</B></TH>
		<TH ALIGN='center'><B>Reply to User</B></TH>
		<TH ALIGN='center'><B>Delete Messages</B></TH>
		</TR>
    
	<%
         int nRows = 0;
         while (rs.next()) {
            nRows++;
            String messageID = rs.getString("messageID");
            String fromUser = rs.getString("fromUser");
            String message = rs.getString("message");
            String messageDate = rs.getString("messageDate");
    %>   
            <TR>
				<TD><%=messageID%></TD>
				<TD><%=fromUser%></TD>
				<TD><%=message%></TD>
				<TD><%=messageDate%></TD>
				<TD><A href='message.jsp?toUser=<%=fromUser%>' target='_blank' id= 'reply' ><IMG SRC='images/reply.jpg'></A></TD>
				<DIV id='somediv' style='display:none;'><DIV id='thedialog' width='350' height='350'></DIV></DIV>
				<TD><input type='checkbox' name='msgList' value='<%=messageID%>'> Delete</TD>
            </TR>
            <div id="dialog"  title="My Dialog Title"></div>
        
         <%      } %>
         
				   
	<%
         
         
         out.println("<TR>");
         out.println("<TD COLSPAN='6' ALIGN='center'>You have " + nRows + " messages.</TD>");
         out.println("</TR>");
         
         out.println("<TR>");
         out.println("<TD COLSPAN='6' ALIGN='center'><button type='submit'><span class='glyphicon glyphicon-remove'></span> Delete Selected Messages</button></TD>");
         out.println("</TR>");
         
         out.println("</TABLE>");
         out.println("</FORM>");         
         
         out.println("<BR><BR>");
         %>
         <form name='lookupByNumberForm' method='post' action='lookupByNumber.jsp'>
         <p><table class='table-hover' width='600' bgcolor='#FFFFEF' border='1' cellpadding='2' cellspacing='4'>
         <tr bgcolor='#EFEFCE'>
            <td colspan='2'><b>Look up by Member Number</b></td>
         </tr>
         <tr>
            <td colspan='2'>Please enter the member number of the person you want to look up.</td>
         </tr>
         <tr>
            <td width='50%' align='right'><input type='text' name='LookupMemberID' value='' size='18' maxlength='20'></td>
            <td width='50%' align='left'><button type='submit' name='cmdGo1'><span class='glyphicon glyphicon-eye-open'></span> See Profile</button></td>
         </tr>
         </table>
         </form>


         <form name='lookupByNameForm' method='get' action='lookupByName.jsp' target='_blank' > <!---->
         <p><table class='table-hover' width=600 bgcolor='#FFFFEF' border='1' cellpadding='2' cellspacing='4'>
         <tr bgcolor='#EFEFCE'>
            <td colspan='2'><b>Look up by Username</b></td>
         </tr>
         <tr>
            <td colspan='2'>Please enter the username of the person you want to look up.</td>
         </tr>
         <tr>
            <td width='50%' align='right'><input id='LookupMemberName' type='text' name='LookupMemberName' onkeyup="showHint(this.value)" size='18' maxlength='20'><p id="txtHint"></p></td>
            <td width='50%' align='left'><button type='submit' name='cmdGo2'><span class='glyphicon glyphicon-eye-open'></span> See Profile</button></td>
         </tr>
         </table>
         </form>
        
<!--
        <script>
          $("#cmdGo2").click(function(){
             var usr = $("#LookupMemberName");
             var req = $.ajax({
                    method: "GET",
                    url: "lookupByName.jsp",
                    data: {
                        name: usr.val()
                    },
                    success: function (data) {
                            var w = window.open();
                          $(w.document.body).html(data);
                    },
                    error: function (XMLHttpRequest, jqXHR, textStatus, errorThrown) {
                        $("#err").html("Check your Username and Password");

                    }
                }); 
              
          })
        </script>
-->

         <form name='searchUserForm' method='post' action='searchUsers.jsp'>
         <p><table class='table-hover' width=600 bgcolor='#FFFFEF' border='1' cellpadding='2' cellspacing='4'>
         <tr bgcolor='#EFEFCE'>
            <td colspan='2'><b>Quick Search</b></td>
         </tr>
         <tr>
            <td width='50%' align='right'>
               <b>Show Me:</b>
               <select name='SeekingGenderID' value=''>
               <option value='Male'>Male</option>
               <option value='Female' selected>Female</option>
               </select>
            </td>
            <td width='50%' align='left'>
               <b>Seeking a:</b>
               <select name='GenderID' value=''>
               <option value='Male' selected>Male</option>
               <option value='Female'>Female</option>
               </select>
            </td>
         </tr>
         <tr>
            <td width='50%' align='right'>
               <b>Age:</b><input type='text' name='MinAge' value='' size='2' maxlength='2'>
            </td>
            <td width='50%' align='left'>
               <b>to</b><input type='text' name='MaxAge' value='' size='2' maxlength='2'>
            </td>
         </tr>
         <tr>
            <td width='50%' align='right'>
               <b>Search Location:</b>
            </td>
            <td width='50%' align='left'>
               <table class='table-hover' border=0 cellpadding=0 cellspacing=0>
                  <tr>
                     <td><b>Country: </b></td>
                     <td>
         <select name='CountryRegionID'>
         	<option value='Afghanistan'         >Afghanistan</option>
         	<option value='Albania'             >Albania</option>
         	<option value='Algeria'             >Algeria</option>
         	<option value='Andorra'             >Andorra</option>
         	<option value='Angola'              >Angola</option>
         	<option value='Anguilla'            >Anguilla</option>
         	<option value='Antarctica'          >Antarctica</option>
         	<option value='Antigua & Barbuda'   >Antigua & Barbuda</option>
         	<option value='Argentina'           >Argentina</option>
         	<option value='Armenia'             >Armenia</option>
         	<option value='Aruba'               >Aruba</option>
         	<option value='Australia'           >Australia</option>
         	<option value='Austria'             >Austria</option>
         	<option value='Azerbaijan'          >Azerbaijan</option>
         	<option value='Bahamas'             >Bahamas</option>
         	<option value='Bahrain'             >Bahrain</option>
         	<option value='Bangladesh'          >Bangladesh</option>
         	<option value='Barbados'            >Barbados</option>
         	<option value='Belarus'             >Belarus</option>
         	<option value='Belgium'             >Belgium</option>
         	<option value='Belize'              >Belize</option>
         	<option value='Benin'               >Benin</option>
         	<option value='Bermuda'             >Bermuda</option>
         	<option value='Bhutan'              >Bhutan</option>
         	<option value='Bolivia'             >Bolivia</option>
         	<option value='Bosnia-Herzgna'      >Bosnia-Herzgna</option>
         	<option value='Botswana'            >Botswana</option>
         	<option value='Brazil'              >Brazil</option>
         	<option value='Brunei'              >Brunei</option>
         	<option value='Bulgaria'            >Bulgaria</option>
         	<option value='Burkina Faso'        >Burkina Faso</option>
         	<option value='Burundi'             >Burundi</option>
         	<option value='Cambodia'            >Cambodia</option>
         	<option value='Cameroon'            >Cameroon</option>
         	<option value='Canada'              >Canada</option>
         	<option value='Cape Verde'          >Cape Verde</option>
         	<option value='Cayman Islands'      >Cayman Islands</option>
         	<option value='Central African Rep.'>Central African Rep.</option>
         	<option value='Chad'                >Chad</option>
         	<option value='Chile'               >Chile</option>
         	<option value='China'               >China</option>
         	<option value='Christmas Island'    >Christmas Island</option>
         	<option value='Cocos (Keeling) Is.' >Cocos (Keeling) Is.</option>
         	<option value='Colombia'            >Colombia</option>
         	<option value='Comoros'             >Comoros</option>
         	<option value='Congo'               >Congo</option>
         	<option value='Congo (Zaire)'       >Congo (Zaire)</option>
         	<option value='Cook Islands'        >Cook Islands</option>
         	<option value='Costa Rica'          >Costa Rica</option>
         	<option value='Cote DIvoire'        >Cote D'Ivoire</option>
         	<option value='Croatia (Hrvatska)'  >Croatia (Hrvatska)</option>
         	<option value='Cyprus'              >Cyprus</option>
         	<option value='Czech Rep.'          >Czech Rep.</option>
         	<option value='Denmark'             >Denmark</option>
         	<option value='Djibouti'            >Djibouti</option>
         	<option value='Dominica'            >Dominica</option>
         	<option value='Dominican Rep.'      >Dominican Rep.</option>
         	<option value='East Timor'          >East Timor</option>
         	<option value='Ecuador'             >Ecuador</option>
         	<option value='Egypt'               >Egypt</option>
         	<option value='El Salvador'         >El Salvador</option>
         	<option value='Equatorial Guinea'   >Equatorial Guinea</option>
         	<option value='Eritrea'             >Eritrea</option>
	       <option value='Estonia'             >Estonia</option>
         	<option value='Ethiopia'            >Ethiopia</option>
         	<option value='Falkland Is.'        >Falkland Is.</option>
         	<option value='Faroe Islands'       >Faroe Islands</option>
         	<option value='Fiji Islands'        >Fiji Islands</option>
         	<option value='Finland'             >Finland</option>
         	<option value='France'              >France</option>
         	<option value='French Guiana'       >French Guiana</option>
         	<option value='French Polynesia'    >French Polynesia</option>
         	<option value='French So. Terr.'    >French So. Terr.</option>
         	<option value='Gabon'               >Gabon</option>
         	<option value='Gambia'              >Gambia</option>
         	<option value='Georgia'             >Georgia</option>
         	<option value='Germany'             >Germany</option>
         	<option value='Ghana'               >Ghana</option>
         	<option value='Gibraltar'           >Gibraltar</option>
         	<option value='Greece'              >Greece</option>
         	<option value='Greenland'           >Greenland</option>
         	<option value='Grenada'             >Grenada</option>
         	<option value='Guadeloupe'          >Guadeloupe</option>
         	<option value='Guam'                >Guam</option>
         	<option value='Guatemala'           >Guatemala</option>
         	<option value='Guinea'              >Guinea</option>
         	<option value='Guinea-Bissau'       >Guinea-Bissau</option>
         	<option value='Guyana'              >Guyana</option>
         	<option value='Haiti'               >Haiti</option>
         	<option value='Honduras'            >Honduras</option>
         	<option value='Hong Kong (China)'   >Hong Kong (China)</option>
         	<option value='Hungary'             >Hungary</option>
         	<option value='Iceland'             >Iceland</option>
         	<option value='India'               >India</option>
         	<option value='Indonesia'           >Indonesia</option>
         	<option value='Ireland'             >Ireland</option>
         	<option value='Israel'              >Israel</option>
         	<option value='Italy'               >Italy</option>
         	<option value='Jamaica'             >Jamaica</option>
         	<option value='Japan'               >Japan</option>
         	<option value='Jordan'              >Jordan</option>
         	<option value='Kazakhstan'          >Kazakhstan</option>
         	<option value='Kenya'               >Kenya</option>
         	<option value='Kiribati'            >Kiribati</option>
         	<option value='Korea, South'        >Korea, South</option>
         	<option value='Kuwait'              >Kuwait</option>
         	<option value='Kyrgyzstan'          >Kyrgyzstan</option>
         	<option value='Laos'                >Laos</option>
         	<option value='Latvia'              >Latvia</option>
         	<option value='Lebanon'             >Lebanon</option>
         	<option value='Lesotho'             >Lesotho</option>
         	<option value='Liechtenstein'       >Liechtenstein</option>
         	<option value='Lithuania'           >Lithuania</option>
         	<option value='Luxembourg'          >Luxembourg</option>
         	<option value='Macau (China)'       >Macau (China)</option>
         	<option value='Macedonia'           >Macedonia</option>
         	<option value='Madagascar'          >Madagascar</option>
         	<option value='Malawi'              >Malawi</option>
         	<option value='Malaysia'            >Malaysia</option>
         	<option value='Maldives'            >Maldives</option>
         	<option value='Mali'                >Mali</option>
         	<option value='Malta'               >Malta</option>
         	<option value='Martinique'          >Martinique</option>
         	<option value='Mauritania'          >Mauritania</option>
         	<option value='Mauritius'           >Mauritius</option>
         	<option value='Mayotte'             >Mayotte</option>
         	<option value='Mexico'              >Mexico</option>
         	<option value='Moldova'             >Moldova</option>
         	<option value='Monaco'              >Monaco</option>
         	<option value='Mongolia'            >Mongolia</option>
         	<option value='Montserrat'          >Montserrat</option>
         	<option value='Morocco'             >Morocco</option>
         	<option value='Mozambique'          >Mozambique</option>
         	<option value='Myanmar'             >Myanmar</option>
         	<option value='Namibia'             >Namibia</option>
         	<option value='Nauru'               >Nauru</option>
         	<option value='Nepal'               >Nepal</option>
         	<option value='Netherlands'         >Netherlands</option>
         	<option value='Netherlands Ant.'    >Netherlands Ant.</option>
         	<option value='New Caledonia'       >New Caledonia</option>
         	<option value='New Zealand'         >New Zealand</option>
         	<option value='Nicaragua'           >Nicaragua</option>
         	<option value='Niger'               >Niger</option>
         	<option value='Nigeria'             >Nigeria</option>
         	<option value='Niue'                >Niue</option>
         	<option value='No. Mariana Is.'     >No. Mariana Is.</option>
         	<option value='Norfolk Island'      >Norfolk Island</option>
         	<option value='Norway'              >Norway</option>
         	<option value='Oman'                >Oman</option>
         	<option value='Pakistan'            >Pakistan</option>
         	<option value='Palau'               >Palau</option>
         	<option value='Panama'              >Panama</option>
         	<option value='Papua new Guinea'    >Papua new Guinea</option>
         	<option value='Paraguay'            >Paraguay</option>
         	<option value='Peru'                >Peru</option>
         	<option value='Philippines'         >Philippines</option>
         	<option value='Pitcairn Is.'        >Pitcairn Is.</option>
         	<option value='Poland'              >Poland</option>
         	<option value='Portugal'            >Portugal</option>
         	<option value='Puerto Rico'         >Puerto Rico</option>
         	<option value='Qatar'               >Qatar</option>
         	<option value='Reunion'             >Reunion</option>
         	<option value='Romania'             >Romania</option>
         	<option value='Russia'              >Russia</option>
         	<option value='Rwanda'              >Rwanda</option>
         	<option value='Saint Helena'        >Saint Helena</option>
         	<option value='Saint Kitts & Nevis' >Saint Kitts & Nevis</option>
         	<option value='Saint Lucia'         >Saint Lucia</option>
         	<option value='Samoa'               >Samoa</option>
         	<option value='San Marino'          >San Marino</option>
         	<option value='Sandwich Islands'    >Sandwich Islands</option>
         	<option value='Sao Tome & Prin.'    >Sao Tome & Prin.</option>
         	<option value='Saudi Arabia'        >Saudi Arabia</option>
         	<option value='Senegal'             >Senegal</option>
         	<option value='Seychelles'          >Seychelles</option>
         	<option value='Sierra Leone'        >Sierra Leone</option>
         	<option value='Singapore'           >Singapore</option>
         	<option value='Slovakia'            >Slovakia</option>
         	<option value='Slovenia'            >Slovenia</option>
         	<option value='Solomon Islands'     >Solomon Islands</option>
         	<option value='Somalia'             >Somalia</option>
         	<option value='South Africa'        >South Africa</option>
         	<option value='Spain'               >Spain</option>
         	<option value='Sri Lanka'           >Sri Lanka</option>
         	<option value='St. Pierre & Miqn'   >St. Pierre & Miq'n</option>
         	<option value='St. Vincent & Greds.'>St. Vincent & Gred's.</option>
         	<option value='Sudan'               >Sudan</option>
         	<option value='Suriname'            >Suriname</option>
         	<option value='Svalbard & J. Mayn'  >Svalbard & J. May'n</option>
         	<option value='Swaziland'           >Swaziland</option>
         	<option value='Sweden'              >Sweden</option>
         	<option value='Switzerland'         >Switzerland</option>
         	<option value='Syria'               >Syria</option>
         	<option value='Taiwan'              >Taiwan</option>
         	<option value='Tajikistan'          >Tajikistan</option>
         	<option value='Tanzania'            >Tanzania</option>
         	<option value='Thailand'            >Thailand</option>
         	<option value='The Vatican'         >The Vatican</option>
         	<option value='Togo'                >Togo</option>
         	<option value='Tokelau'             >Tokelau</option>
         	<option value='Tonga'               >Tonga</option>
         	<option value='Trinidad & Tobago'   >Trinidad & Tobago</option>
         	<option value='Tunisia'             >Tunisia</option>
         	<option value='Turkey'              >Turkey</option>
         	<option value='Turkmenistan'        >Turkmenistan</option>
         	<option value='Turks & Caicos Is.'  >Turks & Caicos Is.</option>
         	<option value='Tuvalu'              >Tuvalu</option>
         	<option value='UAE'                 >UAE</option>
         	<option value='Uganda'              >Uganda</option>
         	<option value='Ukraine'             >Ukraine</option>
	       <option value='United Kingdom'      >United Kingdom</option>
         	<option value='Uruguay'             >Uruguay</option>
         	<option value='USA'  selected       >USA</option>
         	<option value='Uzbekistan'          >Uzbekistan</option>
         	<option value='Vanuatu'             >Vanuatu</option>
         	<option value='Venezuela'           >Venezuela</option>
	       <option value='Vietnam'             >Vietnam</option>
	       <option value='Virgin Islands (UK)' >Virgin Islands (UK)</option>
         	<option value='Virgin Islands (USA)'>Virgin Islands (USA)</option>
           <option value='Wallis & Futuna Is.' >Wallis & Futuna Is.</option>
         	<option value='Western Sahara'      >Western Sahara</option>
	       <option value='Yemen'               >Yemen</option>
           <option value='Yugoslavia'          >Yugoslavia</option>
         	<option value='Zambia'              >Zambia</option>
         	<option value='Zimbabwe'            >Zimbabwe</option>
         </select>
         </td>
         
         
                  </tr>
                  <tr>
                     <td><b>State: </b>
                     <td><input type='text' name='stateName' value='' size='18' maxlength='40'>
                  </tr>
                  <tr>
                     <td><b>City: </b>
                     <td><input type='text' name='cityName' value='' size='18' maxlength='40'>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan='2' align='center'><button type='submit' name='cmdGo3'><span class='glyphicon glyphicon-user'></span> Search</button></td>
         </tr>
         </table>
         </form>
      <% }
      catch (Exception e) {
         out.println
         ("Could not connect to the users database.<P>");
         out.println("The error message was");
         out.println("<PRE>");
         out.println(e.getMessage());
         out.println("</PRE>");
      }
      finally {
         if (rs != null) {
            try { rs.close(); }
            catch (SQLException ignore) {}
         }
         if (stmt != null) {
            try { stmt.close(); }
            catch (SQLException ignore) {}
         }
         if (con != null) {
            try { con.close(); }
            catch (SQLException ignore) {}
         }
      }
      out.println("</header>");
	  out.println("</CENTER>");
      out.println("</BODY>");
      out.println("</HTML>");
			
	}
		catch (RuntimeException e)
		{
			out.println("<script language=\"javascript\">");
			out.println("alert(\"You need to log in to use this service!\");");
			out.println("</script>");
			
			out.println("<a href='index.html'>Click Here</a> to go to the main page.<br><br>");
			
			out.println("Or Click on the button to exit<FORM><INPUT onClick=\"javascipt:window.close()\" TYPE=\"BUTTON\" VALUE=\"Close Browser\" TITLE=\"Click here to close window\" NAME=\"CloseWindow\" STYLE=\"font-family:Verdana, Arial, Helvetica; font-size:smaller; font-weight:bold\"></FORM>");
			
			log(e.getMessage());
			return;
		}
%>
  