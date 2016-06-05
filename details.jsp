<%@ page import="java.sql.*" %>

<html>
<head>
	<title>CSE220 Final Project</title>
	<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
	
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=windows-1252">
	<script language="JavaScript" src="javascript/matchnet.js"></script>
	<script language="JavaScript" src="javascript/region3.js"></script>
	<script language="JavaScript" src="im/im.js"></script>
	<link rel="stylesheet" type="text/css" href="lib/css/as.css">
	<link rel="stylesheet" type="text/css" href="lib/css/common.css">
	
	<link rel="stylesheet" href="details.css" type="text/css">
</head>
<body>

<%
   int id = 0;
   String memberName = "";

   /* 1 means lookup by member id, 2 means lookup by name*/
   int lookupType = Integer.parseInt(request.getParameter("type"));
   
   if (lookupType == 1)
      id = Integer.parseInt(request.getParameter("data"));

   if (lookupType == 2)
      memberName = request.getParameter("data");


    String userName = "";
   int dobMonth = 0;
   int dobDay = 0;
   int dobYear = 0;
   int age = 0;
   String lastLogin = "";
   String email = "";
   String gender = "";
   String seekingGender = "";
   String country = "";
   String state = "";
   String city = "";
   String zip = "";
   String picture = "";
   String aboutMe1 = "";

   int height = 0;
   int weight = 0;

   String study = "";
   String relocate = "";
   String headline = "";
   String occupation ="";
   String occupationDescription="";
   String grewUpIn="";
   String zodiacSign="";
   String languages="";
   String relationType="";
   String maritalStatus="";
   String hairColor="";
   String income="";
   String education="";
   String bodyType="";
   String appearanceImportance="";
   String religion="";
   String eyes="";
   String ethnicity="";
   String politics="";
   String intelligenceImportance="";
   String smoking="";
   String activity="";
   String hasChildren="";
   String drinking="";
   String wantsChildren="";
   String aboutMe2="";
   String personalityTrait="";
   String leisure="";
   String aboutMatch="";
   String cuisineTypes="";
   String musicTypes="";
   String readingWhat="";
   String firstDate="";
   String entertainmentLocation="";
   String phyActivity="";
   String idealRelationship="";
   String learnFromThePast="";
   String sql="";



   if (lookupType == 1)
      sql = "SELECT * FROM userstable WHERE UserID=" + id;

   if (lookupType == 2)
      sql = "SELECT * FROM userstable WHERE UserName='" + memberName + "'";
  
   try
   {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
      Statement s = con.createStatement();      
      ResultSet rs = s.executeQuery(sql);

      while (rs.next())
      {
       userName = rs.getString( "UserName" );
       dobMonth = Integer.parseInt(rs.getString( "DOBmonth" ));
       dobDay = Integer.parseInt(rs.getString( "DOBday" ));
       dobYear = Integer.parseInt(rs.getString( "DOByear" ));
       age = 2003 - dobYear;


       lastLogin = rs.getString("lastLoginDate");
     email = rs.getString( "Email" );
          gender = rs.getString( "Gender" );
          seekingGender = rs.getString( "SeekingGender" );
          country = rs.getString( "Country" );
          state = rs.getString( "State" );
          city = rs.getString( "City" );
          zip = rs.getString( "PostalCode" );
  picture = rs.getString("FileLocation");
          aboutMe1 = rs.getString( "AboutMe1" );

       height = Integer.parseInt( rs.getString( "Height" ) );
       weight = Integer.parseInt(rs.getString( "Weight" ));

         study = rs.getString( "StudiesEmphasis" );
          relocate = rs.getString( "RelocateFlag" );
          headline = rs.getString( "Headline" );
          occupation = rs.getString( "Occupation" );
          occupationDescription = rs.getString( "OccupationDescription" );
          grewUpIn = rs.getString( "GrewUpIn" );
          zodiacSign = rs.getString( "ZodiacSign" );
          languages = rs.getString( "Languages" );
          relationType = rs.getString( "RelationshipType" );
          maritalStatus = rs.getString( "MaritalStatus" );
          hairColor = rs.getString( "HairColor" );
          income = rs.getString( "IncomeLevel" );
          education = rs.getString( "EducationLevel" );
          bodyType = rs.getString( "BodyType" );
          appearanceImportance = rs.getString( "AppearanceImportance" );
          religion = rs.getString( "Religion" );
          eyes = rs.getString( "EyeColor" );
          ethnicity = rs.getString( "Ethnicity" );
          politics = rs.getString( "PoliticalOrientation" );
          intelligenceImportance = rs.getString( "IntelligenceImportance" );
          smoking = rs.getString( "SmokingHabits" );
          activity = rs.getString( "ActivityLevel" );
          hasChildren = rs.getString( "Custody" );
          drinking = rs.getString( "DrinkingHabits" );
          wantsChildren = rs.getString( "MoreChildrenFlag" );
          aboutMe2 = rs.getString( "AboutMe2" );
          personalityTrait = rs.getString( "PersonalityTrait" );
          leisure = rs.getString( "LeisureActivity" );
          aboutMatch = rs.getString( "PerfectMatchEssay" );
          cuisineTypes = rs.getString( "Cuisine" );
          musicTypes = rs.getString( "Music" );
          readingWhat = rs.getString( "Reading" );
          firstDate = rs.getString( "PerfectFirstDateEssay" );
          entertainmentLocation = rs.getString("EntertainmentLocation");
          phyActivity = rs.getString("PhysicalActivity");
          idealRelationship = rs.getString( "IdealRelationshipEssay" );
          learnFromThePast = rs.getString( "LearnFromThePastEssay" );

      }

      s.close();

     con.close();
   }
   catch (SQLException e)
   {
         out.println("<H2>ERROR: </H2>");
         out.println(e.getMessage());
   }
   catch (Exception e)
   {
         out.println("<H2>ERROR: </H2>");
         out.println(e.getMessage());
   }
%>

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin">I am </h3>
  <img src='<%= picture %>' class="img-responsive img-circle margin" style="display:inline" alt="Bird" width=auto height=auto>
  <h3 style="text-transform: uppercase"><%= userName %></h3>
  <h4><%= maritalStatus %>&nbsp;<%= gender %> seeking <%= seekingGender %><BR>was born in <%= dobYear %><br>from <%= city %>, <%= state %>, <%= country %></h4>
</div>

<!-- Second Container -->
<div class="container-fluid bg-2 text-center">
  <h3 class="">Who Am I?</h3>
  <p><b>About me: </b><%= aboutMe1 %> </p>
  <p>Username: <%= userName %></p>
  <p>Gender: <%= gender %> seeking <%= seekingGender %></p>
  <p>From: <%= city %>, <%= state %>, <%= country %> </p>
  <p>Age: <%= age %></p>
  <a href="#" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-user"></span> Me
  </a>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
<!--  <h3 class="">Basics</h3><br>-->
  <div class="row">
    <div class="col-sm-4">
     <h3>Basics</h3>
      <p>Hair: <%= hairColor %> <br>
      Eyes: <%= eyes %> <br>
      Height: <%= height %> cm <br>
      Weight: <%= weight %> kg <br>
      Body Scale: <%= bodyType %> <br>
      Activity Level: <%= activity %> <br>
      Smoking: <%= smoking %> <br>
      Drinking: <%= drinking %> <br>
      Martial Status: <%= maritalStatus %> <br>
      Children: <%= hasChildren %> <br>
      Zodiac Sign: <%= zodiacSign %> <br>
      Languages I speak: <%= languages %> <br>
      Occupation Description: <%= occupationDescription %> <br>
      Seeking: <%= relationType %> <br>
      </p>
    </div>
    <div class="col-sm-4"> 
     <h3>Personality</h3>
      <p>My peronality traits: <%= personalityTrait %> <br>
      My favorite activities: <%= leisure %> <br>
      About the one I am looking for: <%= aboutMatch %> <br>
      My favorite cusines: <%= cuisineTypes %> <br>
      My favorite music: <%= musicTypes %> <br>
      I like to read: <%= readingWhat %> <br>
      My idea of perfect first date: <%= firstDate %> <br>
      </p>
    </div>
    <div class="col-sm-4"> 
      <h3>Leisure and Physical Activites</h3>
      <p>I like going out to: <%= entertainmentLocation %> <br>
      My favorite physical activities: <%= phyActivity %> <br>
      My perception of ideal relationship: <%= idealRelationship %>  <br>
      What I've learned from my past relationships: <%= learnFromThePast %> <br>
      </p>
    </div>
  </div>
</div>
</body>
</html>