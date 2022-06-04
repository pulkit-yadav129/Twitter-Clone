<html>
<link rel="shortcut icon" type="image/png" href="/static/images/favicon.ico"/>
<head>
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>
    <style>
       * {
           box-sizing: border-box;
           margin: 0;
           padding: 0;

       }
       body {
           font-family: Arial, Helvetica, sans-serif;
           color: #fff;

       }
       /* End Global Rolus */
       /* Start Login Box */
       .login-box {
                  width: 360px;
                  height: 360px;
                  margin: 25% auto;
                  border-radius: 10px;
                  border: 2px solid #fff;
                  background-color: #1DA1F2;
              }
       h1 {
           text-align: center;
           padding-top: 20px;
       }
       form {
           width: 300px;
           position: relative;
           left: 35px;
       }
       form label {
           display: flex;
           margin-top: 10px;
           font-size: 15px;
           padding-top: 15px;
           padding-bottom: 5px;
       }
       form input{
           width: 100%;
           padding: 10px;
           border: none;
           border: 2px solid #fff;
           border-radius: 3px;
           outline: none;
       }
       .login-box  input[value="Login"] {
           margin-top: 20px;
           color: #fff;
           background-color: #1DA1F2;
           padding: 8px;
           cursor: pointer;
           font-size: 15px;
           position: relative;
           top: 5px;
       }
       p {
           text-align: center;
           margin-top: 25px;
       }
       /* End Login Box */
       /* Compelet the sign up form */
       .signUp-box {
           width: 360px;
           height: auto;
           margin: 25% auto;
           background-color: #1DA1F2;
           border-radius: 10px;
           border: 2px solid #ADD8E6;
           /* make it display block to see sign up box */
           /* display: none; */
       }
       .signUp-box h1 {
           font-size: 25px;
       }
       .signUp-box  h2 {
           font-size: 15px;
           text-align: center;
           padding-top: 12px;
       }
       .signUp-box hr {
       margin-top: 15px;
       border-color: #fff;
       }
       .signUp-box h3 {
           font-size: 15px;
           padding-top: 10px;
       }
       textarea {
           width: 300px;
           height: 100px;
           padding: 10px;
       }
       .gender {
           width: 200px;
           height: 100px;
           display: flex;
           justify-content: space-around;
       }
       label[for="M"], label[for="F"] {
           font-size: 12px;
           flex-direction: row-reverse;
           align-items: flex-start;
           width: 65px;
           left: -36px;
           position: relative;
           top: -10px;
       }
       input[type="radio"] {
           display: flex;
           align-items: center;
       }
       input[type="submit"] {
           margin-top: -10px;
           color: #fff;
           background-color:#1DA1F2;
           padding: 8px;
           cursor: pointer;
           font-size: 15px;
           position: relative;
           top: -25px;
       }
       .pOne {
           padding: 2px;
           position: relative;
           top: -5px;
           font-size: 12px;
           text-align: center;
       }
       .pTwo {
           position: relative;
           top: 10px;
           color: #000;
           font-size: medium;
       }
       a {
           color: #ADD8E6
       }
       /* End */
    </style>
</head>
<body>
<!-- start login box -->

    <!-- end login box -->

    <!-- start sign up box-->
    <!-- Go to style.css | class (.sign-box) to make code working -->
    <div class="signUp-box">
        <h1>Welcome to Twitter!</h1>
        <h2>Log In to your Twitter account</h2>
        <form action="">

            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Your Email" required >
            <label for="pass">Password</label>
            <input type="password" id="pass" placeholder="Your Password" required >

            <hr>
            <input type="button" id="btn-signup" value="Log In" color=#000>
            <hr>

            </div>
            <p style="color:black; display:none" id="signup-error"></p>


        </form>
        <script>
            function validateSignUpForm()
            {

                var mail=$("#email").val();
                var password=$("#pass").val();

                var error="";


                if(!mail)
                {
                   error+="Email is empty";
                }
                if(!password)
                {
                    error+="Password is empty";
                }

                if( password.length<5)
                {
                      error+="Insufficient length of Password"
                }
                $("#signup-error").html(error);

                if(error.length>0){
                    return false;
                }
                return true;
            }
            $("#btn-signup").click(function(){
               var validForm=validateSignUpForm();
               if(validForm)
               {    $("#signup-error").hide();
                    var user ={

                        "email":$("#email").val(),
                        "password":$("#pass").val()
                    };
                    $.ajax({
                      type: "POST",
                      url: "/login/welcome",
                      data: JSON.stringify(user),
                      success: function(response){
                            if(!!response)
                            {
                                if(response.isLoggedIn===true)
                                 {
                                          location.href="/user/welcome";
                                 }
                                  else
                                  {
                                         alert(response.message);
                                 }
                             }

                      },
                      contentType: "application/json"
                    });
               }
               else
               {
                    $("#signup-error").show();
               }

            });
        </script>

    </div>
    <!-- end sign up box-->
</body>
</html>