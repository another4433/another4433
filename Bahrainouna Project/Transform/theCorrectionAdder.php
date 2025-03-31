<?php
    require("formClass.php");
    include("correctClass.php");
    include("questionClass.php");
    include("answerClass.php");
    require("personClass.php");
    require("registerClass.php");
    include("register2.php");
    include("login2.php");
    require("listForAll.php");
?>
<html lang="en">
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
                    <form action="theCorrectionAdder.php" method="get">
                        <label for="formSelector">Enter the name of the form: </label>
                        <input type="text" name="formSelector" placeholder="The name of the forms are displayed above for you to select">
                        <br><input type="button" name="back" value="Back">
                        <input type="submit" name="submit" value="Confirm">
                    </form>
                </div><br>
        <?php
                if (isset($_GET["formSelector"]) && isset($_GET["submit"])){
        ?>
                    <div class="container">
                        <form action="theCorrectionAdder.php" method="post">
                            <label for="correctAdderQuestion">Enter new question number: </label>
                            <input type="number" name="correctAdderQuestion"><br>
                            <label for="correctAdderAnswer">Enter new answer key: </label>
                            <input type="text" name="correctAdderAnswer"><br>
                            <input type="button" name="back3" value="Back">
                            <input type="submit" name="submit3" value="Submit">
                        </form>
                    </div><br>
        <?php
                    if (isset($_POST["correctAdderQuestion"]) && isset($_POST["correctAdderAnswer"]) && isset($_POST["submit3"])){
                        for ($c = 0; $c < $listForAll->columnSize("form"); $c++){
                            $formReference = $listForAll->get("form", $c);
                            if ($_GET["formSelector"] == $formReference){
                                $formReferer = $formReference->addCorrection($_POST["correctAdderQuestion"], $_POST["correctAdderAnswer"]);
                                $listForAll->replace("form", $formReference, $formReferer);
                            }
                        }
                    }
                    elseif (isset($_POST["back3"])){
                        header("Location: main2.php");
                        exit();
                    }
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