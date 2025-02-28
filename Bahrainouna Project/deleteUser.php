<head>
    <meta charset="utf-8">
    <meta content="width=device-width; initial-scale=1.0">
    <title>Creating Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
</head>
<img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="align-self: center; align-items: center;"><br>
<body id="formBody55">
    <h3 align="center">Choose an option below to start action in this website:</h3><br>
    <nav class="container">
        <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
        <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account-->
        <button id="questions">Quiz</button> <!--Answer Form-->
        <button id="logout">Logout</button> <!--Logout-->
    </nav><br>
    <script src="main1.js">console.log("The rest of the code started from the javascript file.");</script>
</body>
<?php
    try {
        $deletePDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
        $deleteStatement1 = $deletePDO->prepare("Delete From Register Where CPR = :cpr");
        $deleteStatement2 = $deletePDO->prepare("Delete From Login Where CPR = :cpr)");
        $deleteStatement1->bindParam(':cpr', $_SESSION["cpr"]);
        $deleteStatement2->bindParam(':cpr', $_SESSION["cpr"]);
        $deleteStatement1->execute();
        $deleteStatement2->execute();
        if ($deleteStatement1->rowCount() > 0 && $deleteStatement2->rowCount() > 0):
?>
            <script>
                alert("Your account have been successfully deleted!");
                console.warn("Data have been removed from Registered and Login entities.");
                console.time();
                alert("You will be taken back to login page.");
                console.log("The current screen display will be pointed to login page.");
            </script>
<?php
            $_SESSION = array();
            session_destroy();
            header("Location: login1.php");
            exit();
        else:
?>
            <script>
                alert("Failed to delete your account! Account not found.");
                console.error("Data have not been removed from Register and Login entities.");
                console.info("The account was not found in both register and login entities.");
                console.log("I bet the account CPR from session array is different than any other CPR in the database.");
            </script>
<?php
        endif;
    }
    catch(PDOException $e){
?>
        <script>
            alert("There's an error in the database.");
            console.error("There's a bug in the code. Check it!");
        </script>
<?php
        echo "Result: ".$e->getMessage()."<br>";
    }
    catch(Exception $e){
?>
        <script>
            alert("There's an error in the application.");
            console.error("There's a bug in the code. Check it!");
        </script>
<?php
        echo "Result: ".$e->getMessage()."<br>";
    }
?>