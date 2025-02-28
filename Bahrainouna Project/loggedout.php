<head>
    <meta charset="utf-8">
    <meta content="width=device-width; initial-scale=1.0">
    <title>Creating Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
</head>
<img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="align-self: center; align-items: center;"><br>
<body id="formBody555">
    <h3 align="center">Choose an option below to start action in this website:</h3><br>
    <nav class="container">
        <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
        <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, Show Account-->
        <button id="questions">Quiz</button> <!--Answer Form-->
        <button id="logout">Logout</button> <!--Logout-->
    </nav><br>
    <script src="main1.js">console.log("The rest of the code started from the javascript file.");</script>
</body>
<?php
    try {
        $logPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
        $myLog = $logPDO->prepare("Delete From Login Where CPR = :cpr");
        $myLog->bindParam(":cpr", $_SESSION["cpr"]);
        $myLog->execute();
        $_SESSION = array();
        session_destroy();
    }
    catch(PDOException $e){
?>
        <script>
            alert("There's an error in the database.");
            console.error("There's a bug in the code. Check it!");
            console.info("The error came from the database.");
        </script>
<?php
    }
?>
<script>
    alert("You have been logged out of the page.");
    console.warn("The session have been destroyed.");
    console.time();
    alert("Heading back to login page!");
    console.log("The current screen displayed is going to point to login page");
</script>
<?php
    header("login1.php");
    exit();
?>