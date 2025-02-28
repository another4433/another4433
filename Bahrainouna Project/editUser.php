<head>
    <meta charset="utf-8">
    <meta content="width=device-width; initial-scale=1.0">
    <title>Creating Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
</head>
<img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="align-self: center; align-items: center;"><br>
<body id="formBody54">
    <h3 align="center">Choose an option below to start action in this website:</h3><br>
    <nav class="container">
        <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
        <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account-->
        <button id="questions">Quiz</button> <!--Answer Form-->
        <button id="logout">Logout</button> <!--Logout-->
    </nav><br>
    <script src="main1.js">console.log("The rest of the code started from the javascript file.");</script>
</body>
<div class="container">
    <form action="editUser.php" method="post">
        <label for="yourChoice1">Select one or more of these field to be edited and edit it: </label>
        <br><label for="editName1">Enter your name: </label>
        <input type="text" name="editName1" id="pTheChoice01" placeholder="Full name prrferable">
        <br><label for="edittelNum1">Enter your telephone number: </label>
        <input type="tel" name="edittelNum1" id="pTheChoice02" value="+97337763522">
        <br><label for="editemail1">Enter your email: </label>
        <input type="email" name="editemail1" id="pTheChoice03" value="someone@example.com">
        <br><label for="editpassword1">Enter your password: </label>
        <input type="password" name="editpassword1" id="pTheChoice04" placeholder="Up to 20 characters">
        <br><input type="submit" name="theSubmit" id="pSubmit66" value="Confirm">
    </form>
</div><br>
<header>Take note that you cannot change your identification number and your birthdate</header><br>
<?php
    try {
        if (isset($_POST["editsubmission"]) && isset($_POST["editname"])){
            $editPDO = "";
            if (isset($_POST["editname"])):
                $editPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                $editName = $editPDO->prepare("UPDATE Register SET Name = ? WHERE CPR = ?");
                $editName->execute([$_POST["editname"], $_SESSION["cpr"]]);
                if ($editName->rowCount() > 0):
?>
                    <script> 
                        alert("The name in your account have been successfully edited!");
                        console.warn("Name field have been changed in Register entity");
                        console.time();
                    </script>
<?php
                else:
?>
                    <script> 
                        alert("Failed to edit the name in your account! Account not found.");
                        console.error("Data have not been changed from Register entity.");
                        console.info("The account was not found in register entity.");
                        console.log("I bet the account CPR from session array is different than any other CPR in the database.");
                    </script>
<?php
                endif;
            endif;
            if (isset($_POST["editemail"])):
                $editPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                $editEmail1 = $editPDO->prepare("UPDATE Register SET Email = ? WHERE CPR = ?");
                $editEmail2 = $editPDO->prepare("UPDATE Login SET Email = ? WHERE CPR = ?");
                $editEmail1->execute([$_POST["editemail"], $_SESSION["cpr"]]);
                $editEmail2->execute([$_POST["editemail"], $_SESSION["cpr"]]);
                if ($editEmail1->rowCount() > 0 && $editEmail2->rowCount() > 0):
?>
                    <script> 
                        alert("The email in your account have been successfully edited!");
                        console.warn("Email field have been changed in both Register and Login entities.");
                        console.time();
                    </script>
<?php
                else:
?>
                    <script>
                        alert("Failed to edit the email in your account! Account not found.");
                        console.error("Data have not been changed from both Register and Login entities.");
                        console.info("The account was not found in both register and login entities.");
                        console.log("I bet the account CPR from session array is different than any other CPR in the database.");
                    </script>
<?php
                endif;
            endif;
            if (isset($_POST["editpassword"])):
                $editPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                $editPassword1 = $editPDO->prepare("UPDATE Register SET Password = ? WHERE CPR = ?");
                $editPassword2 = $editPDO->prepare("UPDATE Login SET Password = ? WHERE CPR = ?");
                $editPassword1->execute([$_POST["editpassword"], $_SESSION["cpr"]]);
                $editPassword2->execute([$_POST["editpassword"], $_SESSION["cpr"]]);
                if ($editPassword1->rowCount() > 0 && $editPassword2->rowCount() > 0):
?>
                    <script> 
                        alert("The password in your account have been successfully edited!");
                        console.warn("Password field have been changed in both Register and Login entities.");
                        console.time();
                    </script>
<?php
                else:
?>
                    <script> 
                        alert("Failed to edit the password in your account! Account not found.");
                        console.error("Data have not been changed from both Register and Login entities.");
                        console.info("The account was not found in both register and login entities.");
                        console.log("I bet the account CPR from session array is different than any other CPR in the database.");
                    </script>
<?php
                endif;
            endif;
            if (isset($_POST["edittelNum"])){
                $editPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                $editPhony = $editPDO->prepare("UPDATE Register SET TelNum = ? WHERE CPR = ?");
                $editPhony->execute([$_POST["edittelNum"], $_SESSION["cpr"]]);
                if ($editPhony->rowCount() > 0):
?>
                    <script> 
                        alert("The telephone number in your account have been successfully edited!");
                        console.warn("TelNum field have been changed in Register entity.");
                        console.time();
                    </script>
<?php
                else:
?>
                    <script> 
                        alert("Failed to edit the telephone number in your account! Account not found.");
                        console.error("Data have not been changed from Register entity.");
                        console.info("The account was not found in register entity.");
                        console.log("I bet the account CPR from session array is different than any other CPR in the database.");
                    </script>
<?php
                endif;
            }
        }
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