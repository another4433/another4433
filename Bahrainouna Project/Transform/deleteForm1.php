<?php
    include("dataStructure.php");
    require("formClass.php");
    include("correctClass.php");
    include("questionClass.php");
    include("answerClass.php");
    require("personClass.php");
    require("registerClass.php");
    include("register2.php");
    include("login2.php");
    require("listForAll.php");
    include("createForm.php");
    include("editForm.php");
    $countForm = ($listForAll->columnSize("form") === 0) ? 0 : $listForAll->columnSize("form");
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Login to Bahrainouna Q&A!</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2'
        </script>
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body>
        <h1 align="center">Welcome to Bahrainouna Q&A</h1><br>
        <?php
            try {
                echo "<header>List of form names:<header><br>";
                for ($i = 0; $i < $listForAll->columnSize("form"); $i++){
                    $itemFromArray = $listForAll->get("form", $i);
                    $formReference = new Form($itemFromArray->getName(), $itemFromArray->getOwner());
                    echo $formReference->getFormID().". ".$formReference->getFormName()."<br>";
                }
                echo "<br>";
        ?>
                <div class="container">
                    <form action="showForm1.php" method="get">
                        <label for="formSelector">Enter the name of the form: </label>
                        <input type="text" name="formSelector" placeholder="The name of the forms are displayed above for you to select">
                        <br><input type="button" name="back" value="Back">
                        <input type="submit" name="submit" value="Confirm">
                    </form>
                </div><br>
        <?php
                if (isset($_GET["formSelector"]) && isset($_GET["submit"])){
                    $pdo = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                    $stmt = $pdo->prepare("SELECT * FROM Register WHERE CPR = ? AND Email = ? AND Password = ?");
                    $stmt->execute([$_SESSION["cpr"], $_SESSION["email"], $_SESSION["password"]]);
                    $theOwner = $stmt->fetch();
                    if (isset($theOwner)){
                        $theYear = subString($theOwner["DOB"], 0, getIndex($theOwner["DOB"], '-'));
                        $theMonth = subString($theOwner["DOB"], getIndex($theOwner["DOB"], '-'), getLastIndex($theOwner["DOB"], '-'));
                        $theDay = subString($theOwner["DOB"], getLastIndex($theOwner["DOB"], '-'), getLastIndex($theOwner["DOB"], '%#')-1);
                        $owner = new PhpRegister($theOwner["Name"], $_SESSION["cpr"], $theOwner["TelNum"], $theDay, $theMonth, $theYear, $_SESSION["email"], $_SESSION["password"]);
                        $formReference = new Form($_GET["formSelector"], $owner);
                        $backup = $listForAll->removeItem("form", $formReference);
                        if ($backup != false && $backup != null){
        ?>
                            <script>
                                Swal.fire({
                                    title: 'Success!',
                                    text: 'The form have been successfully deleted!',
                                    icon: 'success',
                                    confirmButtonText: 'Cool', 
                                    draggable: true
                                });
                                console.warn("Data have been removed from Form, Questions, Answers, QandA, Corrections, and Form entities.");
                                console.time();
                            </script>
        <?php
                            header("main2.php");
                            exit();
                        }
                        else {
        ?>
                            <script>
                                Swal.fire({
                                    title: 'Error!',
                                    text: 'Failed to delete the Form! Form not found.',
                                    icon: 'error',
                                    confirmButtonText: 'OK', 
                                    draggable: true
                                });
                                console.error("Data have not been removed from Form, Questions, Answers, QandA, Corrections, and Form entities.");
                                console.info("The FormID was not found in Form, Questions, Answers, QandA, Corrections, and Form entities.");
                            </script>
        <?php
                        }
                    }
                    else {
        ?>
                        <script>
                            Swal.fire({
                                title: 'Error!',
                                text: 'Failed to look for the form due to account finding issue.',
                                icon: 'error',
                                confirmButtonText: 'OK', 
                                draggable: true
                            });
                            console.error("The owner variable wasn't set that caused the error when doing $stmt->fetch();.");
                        </script>
        <?php
                    }
                }
                elseif (isset($_GET["back"])){
                    header("Location: main2.php");
                    exit();
                }
            }
            catch(Exception $exception){
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
                echo "Result: ".$exception->getMessage()."<br>";
            }
        ?>
    </body>
</html>