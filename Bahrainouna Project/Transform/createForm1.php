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
    <body>
        <h1 align="center">Welcome to Bahrainouna Q&A</h1><br>
        <h4 align="center">Fill in the followings: </h4>
        <div class="container">
            <form accept="createForm1.php" method="post">
                <label for="formName">Enter the name of the form: </label>
                <input type="text" name="formName" value="form<?=$countForm+1?>">
                <br><input type="button" name="button" value="Back">
                <input type="submit" name="submit" value="Submit">
            </form>
        </div>
    </body>
</html>
<?php
    try {
        if (isset($_POST["formName"]) && isset($_POST["submit"])){
            $theFormClass = new Form($_POST["name"], $account);
            $theFormClass->setFormID($countForm+1);
            $listForAll->add("form", $theFormClass);
            if ($listForAll->search("form", $theFormClass)){
                $countForm = $countForm + 1;
?>
                <script>
                    Swal.fire({
                        title: 'Success!',
                        text: 'A new form have been added to the list.',
                        icon: 'success',
                        confirmButtonText: 'Cool', 
                        draggable: true
                    });
                    console.warn("An item have been added to the listForAll variable through form class.");
                </script><br>
                <div class="container">
                    <form action="createForm1.php" method="get">
                        <label for="optionForForm">Choose any option below to make changes to the form: </label>
                        <br><input type="radio" name="optionForForm" value="add question">Add question
                        <br><input type="radio" name="optionForForm" value="add answer">Add answer
                        <br><input type="radio" name="optionForForm" value="add question and answer">Add question and answer
                        <br><input type="radio" name="optionForForm" value="add correction">Add correction
                        <br><input type="submit" name="theSubmission" value="Confirm">
                    </form>
                </div><br>
                <?php
                    try {
                        if (isset($_GET["theSubmission"]) && isset($_GET["optionForForm"])){
                            switch($_GET["optionForForm"]){
                                case "add question": 
                                    header("Location: theQuestionAdder.php");
                                    break;
                                case "add answer":
                                    header("Location: theAnswerAdder.php");
                                    break;
                                case "add question and answer":
                                    header("Location: theQ&A_adder.php");
                                    break;
                                case "add correction": 
                                    header("Location: theCorrectAdder.php");
                                    break;
                            }
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
<?php
            }
            else {
?>
                <script>
                    Swal.fire({
                        title: 'Error!',
                        text: 'Failed to add a new form to the list.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                    console.error("There's a bug in the code. Check it!");
                </script>
<?php
                header("Location: main2.php");
                exit();
            }
        }
        elseif (isset($_POST["button"])){
            header("Location: main2.php");
            exit();
        }
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