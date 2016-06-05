<html>
<head>
	<title>CSE220 Final Project</title>
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=windows-1252">
	<script language="JavaScript" src="javascript/matchnet.js"></script>
	<script language="JavaScript" src="javascript/region3.js"></script>
	<script language="JavaScript" src="is/im.js"></script>
	<link rel="stylesheet" type="text/css" href="lib/css/as.css">
	<link rel="stylesheet" type="text/css" href="lib/css/common.css">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>

<body marginheight=0 marginwidth=0 topmargin=0 leftmargin=0 text="#000000" bgcolor="#ffffff">

<%
   String userName = request.getParameter( "UserName" );
   String password = request.getParameter( "Password" );
   String dobMonth = request.getParameter( "BirthDate_month" );
   String dobDay = request.getParameter( "BirthDate_day" );
   String dobYear = request.getParameter( "BirthDate_year" );
   String email = request.getParameter( "Email" );
   String gender = request.getParameter( "GenderID" );
   String seekingGender = request.getParameter( "SeekingGenderID" );
   String country = request.getParameter( "CountryRegionID" );
   String state = request.getParameter( "State" );
   String city = request.getParameter( "City" );
   String zip = request.getParameter( "PostalCode" );
%>

<center>
<div>
   <form class="form-horizontal" id="myfrm" method="post" action="register_03.jsp">
    <div class="progress">
        <div class="progress-bar " role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
            <span class="">70% Complete</span>
        </div>
    </div>
    <fieldset class="form-group">
        <legend>CONGRATULATIONS</legend>
        <small>Double check your Username and Password. You will need it later.</small>
        <div class="form-group row">
            <label for="userName" class="col-sm-3 form-control-label form-control-sm">User Name:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-sm input-sm" name="UserName" id="userName" tabindex="1" value="<%= userName %>" readonly/>
            </div>
        </div>
        <div class="form-group row">
            <label for="password" class="col-sm-3 form-control-label form-control-sm">Password:</label>
            <div class="col-sm-6">
                <input id="pswrd" type="pasword" class="form-control form-control-sm input-sm" name="txtpassword" value="<%= password %>" id="password" tabindex="2" readonly/>
            </div>
        </div>
        <div class="form-group row">
            <label for="dob" class="col-sm-3 form-control-label">Date of Birth:</label>
            <div class="col-sm-6">
                <input class="form-control form-control-sm input-sm" type="text" id="datepicker" value="<%= dobMonth %>/<%= dobDay %>/<%= dobYear %>" tabindex="4" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-sm-3 form-control-label">Email:</label>
            <div class="col-sm-6">
                <input class="form-control form-control-sm input-sm" type="text" id="email" value="<%= email %>" tabindex="5" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="from" class="col-sm-3 form-control-label">From:</label>
            <div class="col-sm-6">
                <input class="form-control form-control-sm input-sm" type="text" id="from" value="<%= city %>, <%= state %> <%= zip %> <%= country %>" tabindex="5" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="youarea" class="col-sm-3 form-control-label">You are a:</label>
            <div class="col-sm-6">
                <input class="form-control form-control-sm input-sm" type="text" id="youarea" value="<%= gender %> seeking <%= seekingGender %>" tabindex="5" readonly>
            </div>
        </div>
        <div class="form-group">
            <span class="col-sm-12 label label-info">Be Smart ! Introduce yourself with few words and a photo.</span>
        </div>
        <div class="form-group row">
            <label for="aboutyou" class="col-sm-3 form-control-label">What is the first thing you want people to know about you?:
                <a href="greatEssays.html" target="_blank">Need Help?</a>
            </label>
            <div class="col-sm-6">
                <textarea class="form-control" rows="5" id="aboutyou" tabindex="1"></textarea>
            </div>
        </div>
        <div class="form-group row">
            <label for="photo" class="col-sm-3 form-control-label">Upload your photo:</label>
            <div class="col-sm-6">
                <label class="file">
                    <input id="TFileID" type="file" id="file">
                    <span class="file-custom"></span>
                </label>
            </div>
        </div>
        <a href="register_01.jsp" class="btn btn-primary pull-left" role="button">Previous</a>
<button type="submit" class="btn btn-primary pull-right" id="sub" >Next</button>
    </fieldset>
</form>

</div>
    
<script>
    function loadDoc() {
        var username = "<%= userName %>";
        var password = "<%= password %>";
        var dob_month = "<%= dobMonth %>";
        var dob_day = "<%= dobDay %>";
        var dob_year = "<%= dobYear %>";
        var email = "<%= email %>";
        var sex = "<%= gender %>";
        var sex2 = "<%= seekingGender %>";
        var country = "<%= country %>";
        var state = "<%= state %>";
        var city = "<%= city %>";
        var zip = "<%= zip %>";
        var abtme = $("#aboutyou");
        var TFileID = $("#TFileID");
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                document.getElementById("myfrm").innerHTML = xhttp.responseText;
                alert("");
            }
        };
        xhttp.open("POST", "register_03.jsp?UserName=username&Password=password&BirthDate_month= dob_month&BirthDate_day= dob_day&BirthDate_year=dob_year&Email=email&GenderID=sex&SeekingGenderID=sex2&CountryRegionID=country&State=state&City=city&PostalCode=zip.val&AboutMe=abtme.val()&TFileID=TFileID.val()", true);
        xhttp.send("NULL");
    }
</script>
    
    
    
<!--
    
//    $("#sub").click(function(){
//        var req = $.ajax({
//                type: "POST",
//                url: "register_03.jsp",
//                data: {
//                    UserName: username.val(),
//                    Password: password.val(),
//                    BirthDate_month: dob_month,
//                    BirthDate_day: dob_day,
//                    BirthDate_year: dob_year,
//                    Email: email.val() ,
//                    GenderID: sex,
//                    SeekingGenderID: sex2,
//                    CountryRegionID: country.val() ,
//                    State: state.val() ,
//                    City: city.val(),
//                    PostalCode: zip.val()
//                },
//                dataType: "html"
//            });
//            //            }
//            req.done(function (msg) {
//                $(".form-horizontal").html(msg);
//            });
//
//            req.fail(function (jqXHR, textStatus) {
//                alert("Request failed: " + textStatus);
//            });
//    });
    
-->
    



<!--
<script language=JavaScript>
	var blnAbortValidation = false;
	
	function validateFormfrmWelcome() {
		if (blnAbortValidation == true) {
			blnAbortValidation = false;
			return true;
		}
	
	var vfrmWelcometxaAboutMe = document.frmWelcome.AboutMe;
	var vfrmWelcomefilTFileID = document.frmWelcome.TFileID;
	
	if(!IsEmpty(vfrmWelcometxaAboutMe, 'textarea')) {
		if ( InLengthRange(vfrmWelcometxaAboutMe.value, 0, 2000) == false) {
			ModalBox(false,"Introduce Yourself: must be between 0 and 2000 characters");
			vfrmWelcometxaAboutMe.focus();
			return false;
		}
	}
}
</script>
-->

</center>
</body>
</html>