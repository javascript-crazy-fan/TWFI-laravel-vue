<!Doctype html>
    <head>
        <title>Email For New Account</title>
    </head>
    <body>
        <h1>Hi, {{$first_name}} {{$last_name}}</h1>
        <p>Your have been invited by Admin to the "TWFI" management system.</p>
        <p>We recommend to change your password after login.</p>
        <br>
        <p>System URL: <a href="http://projects.troutmanwelding.com">http://projects.troutmanwelding.com</a></p>
        <p>Email: {{$email}} </p>
        <p>Name: {{$first_name}} {{$last_name}}</p>
        <p>Temporary Password: "1"</p>
    </body>
</html>