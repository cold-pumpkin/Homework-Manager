<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
   <title>NtoS</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
function verifynotify(field1, field2, result_id, match_html, nomatch_html) {
  this.field1 = field1;
  this.field2 = field2;
  this.result_id = result_id;
  this.match_html = match_html;
  this.nomatch_html = nomatch_html;

  this.check = function() {
    // Make sure we don't cause an error
    // for browsers that do not support getElementById
    if (!this.result_id) { return false; }
    if (!document.getElementById){ return false; }
    r = document.getElementById(this.result_id);
    if (!r){ return false; }

    if (this.field1.value != "" && this.field1.value == this.field2.value) {
      r.innerHTML = this.match_html;
    } else {
      r.innerHTML = this.nomatch_html;
    }
  }
}

function verifyInput() {
  verify = new verifynotify();
  verify.field1 = document.password_form.password1;
  verify.field2 = document.password_form.password2;
  verify.result_id = "password_result";
  verify.match_html = "<span style=\"color:blue\">패스워드가 일치합니다!<\/span>";
  verify.nomatch_html = "<span style=\"color:red\">귀하의 비밀 번호가 일치하는지 확인하십시오!<\/span>";

  // Update the result message
  verify.check();
}

// Multiple onload function created by: Simon Willison
// http://simonwillison.net/2004/May/26/addLoadEvent/
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(function() {
  verifyInput();
});
//-->
</SCRIPT>
  


   
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../css/util.css">
   <link rel="stylesheet" type="text/css" href="../css/main.css">
<!--===============================================================================================-->
</head>
<body>
   
	<!--==============Logo & Menu Bar=================-->
	<%@ include file="/WEB-INF/views/menu/_navbar.jsp"%>

   
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
            <div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
               <span class="login100-form-title-1">
                  Update Info
               </span>
            </div>

            <form class="login100-form validate-form" action="/memberUpdate" method="post">
               <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                  <span class="label-input100">Username</span>
                  <input class="input100" type="text" name="memberName" value="${member1.memberName}" readonly>
                  <span class="focus-input100"></span>
               </div>

               <div class="wrap-input100 validate-input m-b-18" data-validate = "Email is required">
                  <span class="label-input100">Email</span>
                  <input class="input100" type="email" name="email" placeholder="${member1.email}">
                  <span class="focus-input100"></span>
               </div>
               
               <div class="wrap-input100 validate-input m-b-18" data-validate = "Department is required">
                  <span class="label-input100">Department</span>
                  <input  type="radio" name="memberDepart" value="빅데이터" checked="checked">빅데이터
                  <input type="radio" name="memberDepart" value="사물인터넷">사물인터넷
                    <input  type="radio" name="memberDepart" value="응용소프트웨어">응용소프트웨어
                  <span class="focus-input100"></span>
               </div>
               
 			   <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                  <span class="label-input100">password</span>
                  <input class="input100" type="password" name="password"  onkeyup="verify.check()"placeholder="Enter password">
                  <span class="focus-input100"></span>
               </div>
               
                  <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                  <span class="label-input100">PW check</span>
                  <input class="input100" type="password" name="PwCheck"   onkeyup="verify.check()"placeholder="Enter password">
                  <span class="focus-input100"></span>
               </div>
               <div class="flex-sb-m w-full p-b-30">
                  <div class="contact100-form-checkbox">
                     <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                     <label class="label-checkbox100" for="ckb1">
                        Remember me
                     </label>
                  </div>
                  <!-- 
                  <div>
                     <a href="#" class="txt1">
                        Forgot Password?
                     </a>
                  </div>  -->
               </div>
                  
               <div class="container-login100-form-btn">
                  <input type="submit" class="login100-form-btn" value="update">      
               </div>
            </form>
         </div>
      </div>
   </div>
  <script type="text/javascript">
    function tocheckpw1() {
        var pw = document.getElementById("password").value;
        var pwck = document.getElementById("PwCheck").value;
 
        if (pw != pwck) {
            alert('비밀번호가 틀렸습니다. 다시 입력해 주세요');
            return false;
        }
    }
</script>


<!--===============================================================================================-->
   <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="vendor/bootstrap/js/popper.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
   <script src="vendor/daterangepicker/moment.min.js"></script>
   <script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
   <script src="js/main.js"></script>

</body>
</html>