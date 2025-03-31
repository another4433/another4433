<?php
    require("personClass.php");
    require("registerClass.php");
    require("loginClass.php");
    include("dataStructure.php");
    include("listForAll.php");
    include("register2.php");
    include("login2.php");
    include("createUser1.php");
?>
<html>
    <head>
    <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Login to Bahrainouna Q&A!</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2'
        </script>
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body id="formBody55"><h1 align="center">Welcome to Bahrainouna Q&A</h1><br></body>
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
                            Swal.fire({
                                title: 'Success!',
                                text: 'The name in your account have been successfully edited!',
                                icon: 'success',
                                confirmButtonText: 'Cool', 
                                draggable: true
                            });
                            console.warn("Name field have been changed in Register entity");
                            console.time();
                        </script>
    <?php
                    else:
    ?>
                        <script> 
                            Swal.fire({
                                title: 'Error!',
                                text: 'Failed to edit the name in your account! Account not found.',
                                icon: 'error',
                                confirmButtonText: 'OK', 
                                draggable: true
                            });
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
                            Swal.fire({
                                title: 'Success!',
                                text: 'The email in your account have been successfully edited!',
                                icon: 'success',
                                confirmButtonText: 'Cool', 
                                draggable: true
                            });
                            console.warn("Email field have been changed in both Register and Login entities.");
                            console.time();
                        </script>
    <?php
                    else:
    ?>
                        <script>
                            Swal.fire({
                                title: 'Error!',
                                text: 'Failed to edit the email in your account! Account not found.',
                                icon: 'error',
                                confirmButtonText: 'OK', 
                                draggable: true
                            });
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
                            Swal.fire({
                                title: 'Success!',
                                text: 'The password in your account have been successfully edited!',
                                icon: 'success',
                                confirmButtonText: 'Cool', 
                                draggable: true
                            });
                            console.warn("Password field have been changed in both Register and Login entities.");
                            console.time();
                        </script>
    <?php
                    else:
    ?>
                        <script> 
                            alert("Failed to edit the password in your account! Account not found.");
                            Swal.fire({
                                title: 'Error!',
                                text: 'Failed to edit the password in your account! Account not found.',
                                icon: 'error',
                                confirmButtonText: 'OK', 
                                draggable: true
                            });
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
                            Swal.fire({
                                title: 'Success!',
                                text: 'The telephone number in your account have been successfully edited!',
                                icon: 'success',
                                confirmButtonText: 'Cool', 
                                draggable: true
                            });
                            console.warn("TelNum field have been changed in Register entity.");
                            console.time();
                        </script>
    <?php
                    else:
    ?>
                        <script> 
                            Swal.fire({
                                title: 'Error!',
                                text: 'Failed to edit the telephone number in your account! Account not found.',
                                icon: 'error',
                                confirmButtonText: 'OK', 
                                draggable: true
                            });
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
                Swal.fire({
                    title: 'Error!',
                    text: 'There is a problem in the database.',
                    icon: 'error',
                    confirmButtonText: 'OK', 
                    draggable: true
                });
                console.error("There's a bug in the code. Check it!");
            </script>
    <?php
            echo "Result: ".$e->getMessage()."<br>";
        }
        catch(Exception $e){
    ?>
            <script> 
                Swal.fire({
                    title: 'Error!',
                    text: 'There is a problem in the application.',
                    icon: 'error',
                    confirmButtonText: 'OK',
                    draggable: true
                });
                console.error("There's a bug in the code. Check it!");
            </script>
    <?php
            echo "Result: ".$e->getMessage()."<br>";
        }
    ?>
</html>