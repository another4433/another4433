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
    $countForm = ($listForAll->columnSize("form") === 0) ? 0 : $listForAll->columnSize("form");
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
                    <form action="editForm1.php" method="get">
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
                        <form action="editForm1.php" method="post">
                            <label for="elementSelectors">Select the elements of the form that needs to be edited: </label>
                            <br><input type="checkbox" name="elementSelectors" value="form name">Form name
                            <br><input type="checkbox" name="elementSelectors" value="add question">Add Question 
                            <br><input type="checkbox" name="elementSelectors" value="add answer">Add Answer
                            <br><input type="checkbox" name="elementSelectors" value="delete question">Delete Question
                            <br><input type="checkbox" name="elementSelectors" value="delete answer">Delete Answer
                            <br><input type="checkbox" name="elementSelectors" value="modify question">Modify Question
                            <br><input type="checkbox" name="elementSelectors" value="modify answer">Modify Answer
                            <br><input type="checkbox" name="elementSelectors" value="add correction">Add Correction
                            <br><input type="checkbox" name="elementSelectors" value="delete correction">Delete Correction 
                            <br><input type="checkbox" name="elementSelectors" value="modify correction">Modify Correction
                            <br><input type="button" name="returnBack" value="Back">
                            <input type="submit" name="submission" value="Confirm">
                        </form>
                    </div><br>
        <?php
                    if (isset($_POST["elementSelectors"]) && isset($_POST["submission"])){
                        if ($_POST["elementSelectors"] === "form name"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="theFormName">Enter the new name for the form: </label>
                                    <input type="text" name="theFormName">
                                    <br><input type="button" name="returningBack" value="Back">
                                    <input type="submit" name="submit" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["theFormName"]) && isset($_POST["submit"])){
                                for ($i = 0; $i < $listForAll->columnSize("form"); $i++){
                                    $formReference = $listForAll->get("form", $i);
                                    if ($_GET["formSelector"] == $formReference){
                                        $formReferer = $formReference->setFormName($_POST["theFormName"]);
                                        $listForAll->replace("form", $formReference, $formReferer);
                                        break;
                                    }
                                }
                            }
                            elseif (isset($_POST["returningBack"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "add question"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="theQuestionName">Enter the name of the new question: </label>
                                    <input type="text" name="theQuestionName">
                                    <br><input type="button" name="back1" value="Back">
                                    <input type="submit" name="submit1" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["theQuestionName"]) && isset($_POST["submit1"])){
                                for ($a = 0; $a < $listForAll->columnSize("key"); $a++){
                                    $formReference = $listForAll->get("form", $a);
                                    if ($formReference == $_GET["formSelector"]){
                                        $formReferer = $formReference->addQuestion($_POST["theQuestionName"]);
                                        $listForAll->replace("form", $formReference, $formReferer);
                                    }
                                }
                            }
                            elseif (isset($_POST["back1"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "delete question"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="theQuestionName">Enter the name of the old question: </label>
                                    <input type="text" name="theQuestionName">
                                    <br><input type="button" name="back2" value="Back">
                                    <input type="submit" name="submit2" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["theQuestionName"]) && isset($_POST["submit2"])){
                                for ($a = 0; $a < $listForAll->columnSize("key"); $a++){
                                    $formReference = $listForAll->get("form", $a);
                                    if ($formReference == $_GET["formSelector"]){
                                        $formReferer = $formReference->deleteQuestion($_POST["theQuestionName"]);
                                        $listForAll->replace("form", $formReference, $formReferer);
                                    }
                                }
                            }
                            elseif (isset($_POST["back2"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "modify question"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="theQuestionName1">Enter the name of the old question: </label>
                                    <input type="text" name="theQuestionName1"><br>
                                    <label for="theQuestionName2">Enter the name of the new question: </label>
                                    <br><input type="button" name="back8" value="Back">
                                    <input type="submit" name="submit8" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["theQuestionName1"]) && isset($_POST["submit8"]) && isset($_POST["theQuestionName2"])){
                                for ($a = 0; $a < $listForAll->columnSize("key"); $a++){
                                    $formReference = $listForAll->get("form", $a);
                                    if ($formReference == $_GET["formSelector"]){
                                        $formReferer = $formReference->changeQuestion($_POST["theQuestionName1"], $_POST["theQuestionName2"]);
                                        $listForAll->replace("form", $formReference, $formReferer);
                                    }
                                }
                            }
                            elseif (isset($_POST["back8"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "add correction"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
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
                        if ($_POST["elementSelector"] === "delete correction"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="correctRemoverQuestion">Enter old question number: </label>
                                    <input type="number" name="correctRemoverQuestion"><br>
                                    <label for="correctRemoverAnswer">Enter old answer key: </label>
                                    <input type="text" name="correctRemoverAnswer"><br>
                                    <input type="button" name="back4" value="Back">
                                    <input type="submit" name="submit4" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["correctRemoverQuestion"]) && isset($_POST["correctRemoverAnswer"]) && isset($_POST["submit4"])){
                                for ($c = 0; $c < $listForAll->columnSize("form"); $c++){
                                    $formReference = $listForAll->get("form", $c);
                                    if ($_GET["formSelector"] == $formReference){
                                        $formReferer = $formReference->deleteCorrection($_POST["correctRemoverQuestion"], $_POST["correctRemoverAnswer"]);
                                        $listForAll->replace("form", $formReference, $formReferer);
                                    }
                                }
                            }
                            elseif (isset($_POST["back4"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "modify correction"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="correctModifyQuestion1">Enter old question number: </label>
                                    <input type="number" name="correctModifyQuestion1"><br>
                                    <label for="correctModifyAnswer1">Enter old answer key: </label>
                                    <input type="text" name="correctModifyAnswer1"><br>
                                    <label for="correctModifyQuestion2">Enter new question number: </label>
                                    <input type="number" name="correctModifyQuestion2"><br>
                                    <label for="correctModifyAnswer2">Enter new answer key: </label>
                                    <input type="text" name="correctModifyAnswer2"><br>
                                    <input type="button" name="back4" value="Back">
                                    <input type="submit" name="submit4" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["correctModifyQuestion1"]) && isset($_POST["correctModifyQuestion2"]) && isset($_POST["submit4"]) && isset($_POST["correctModifyAnswer1"]) && isset($_POST["correctModifyAnswer2"])){
                                for ($c = 0; $c < $listForAll->columnSize("form"); $c++){
                                    $formReference = $listForAll->get("form", $c);
                                    if ($_GET["formSelector"] == $formReference){
                                        $formReferer = $formReference->modifyCorrection($_POST["correctModifyQuestion1"], $_POST["correctModifyAnswer1"], $_POST["correctModifyQuestion2"], $_POST["correctModifyAnswer2"]);
                                        $listForAll->replace("form", $formReference, $formReferer);
                                    }
                                }
                            }
                            elseif (isset($_POST["back4"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "add answer"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="enteringQuestion">Enter the name of the question: </label>
                                    <input type="text" name="enteringQuestion"><br>
                                    <label>Enter new answer: </label>
                                    <input type="text" name="enteringAnswerKey" placeholder="Answer Key">
                                    <input type="text" name="enteringAnswerDetail" placeholder="Answer Detail">
                                    <br><input type="button" name="back5" value="Back">
                                    <input type="submit" name="submit5" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["enteringQuestion"]) && isset($_POST["enteringAnswerDetail"]) && isset($_POST["submit5"])){
                                for ($d = 0; $d < $listForAll->columnSize("form"); $d++){
                                    $formReference = $listForAll->get("form", $d);
                                    if ($formReference == $_GET["formSelector"]){
                                        for ($e = 0; $e < $formReference->getQuestionSize(); $e++){
                                            $questionReference = $formReference->getQuestion($e);
                                            if ($questionReference == $_POST["enteringQuestion"]){
                                                $formReferer = $formReference->addAnswerInQuestion($_POST["enteringQuestion"], $_POST["enteringAnswerKey"], $_POST["enteringAnswerDetail"]);
                                                $listForAll->replace("form", $formReference, $formReferer);
                                            }
                                        }
                                    }
                                }
                            }
                            elseif (isset($_POST["back5"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "delete answer"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="enteringQuestion">Enter the name of the question: </label>
                                    <input type="text" name="enteringQuestion"><br>
                                    <label>Enter old answer: </label>
                                    <input type="text" name="enteringAnswerKey" placeholder="Answer Key">
                                    <input type="text" name="enteringAnswerDetail" placeholder="Answer Detail">
                                    <br><input type="button" name="back6" value="Back">
                                    <input type="submit" name="submit6" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["enteringQuestion"]) && isset($_POST["enteringAnswerDetail"]) && isset($_POST["submit6"])){
                                for ($d = 0; $d < $listForAll->columnSize("form"); $d++){
                                    $formReference = $listForAll->get("form", $d);
                                    if ($formReference == $_GET["formSelector"]){
                                        for ($e = 0; $e < $formReference->getQuestionSize(); $e++){
                                            $questionReference = $formReference->getQuestion($e);
                                            if ($questionReference == $_POST["enteringQuestion"]){
                                                $formReferer = $formReference->removeAnswerInQuestion($_POST["enteringQuestion"], $_POST["enteringAnswerKey"], $_POST["enteringAnswerDetail"]);
                                                $listForAll->replace("form", $formReference, $formReferer);
                                            }
                                        }
                                    }
                                }
                            }
                            elseif (isset($_POST["back6"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                        if ($_POST["elementSelector"] === "delete answer"){
        ?>
                            <div class="container">
                                <form action="editForm1.php" method="post">
                                    <label for="enteringQuestion">Enter the name of the question: </label>
                                    <input type="text" name="enteringQuestion">
                                    <br><label>Enter old answer: </label>
                                    <input type="text" name="enteringAnswerKey1" placeholder="Answer Key">
                                    <input type="text" name="enteringAnswerDetail1" placeholder="Answer Detail">
                                    <br><label>Enter new answer: </label>
                                    <input type="text" name="enteringAnswerKey2" placeholder="Answer Key">
                                    <input type="text" name="enteringAnswerDetail2" placeholder="Answer Detail">
                                    <br><input type="button" name="back7" value="Back">
                                    <input type="submit" name="submit7" value="Submit">
                                </form>
                            </div><br>
        <?php
                            if (isset($_POST["enteringQuestion1"]) && isset($_POST["enteringAnswerDetail1"]) && isset($_POST["submit7"]) && isset($_POST["enteringAnswerKey2"]) && isset($_POST["enteringAnswerDetail2"])){
                                for ($d = 0; $d < $listForAll->columnSize("form"); $d++){
                                    $formReference = $listForAll->get("form", $d);
                                    if ($formReference == $_GET["formSelector"]){
                                        for ($e = 0; $e < $formReference->getQuestionSize(); $e++){
                                            $questionReference = $formReference->getQuestion($e);
                                            if ($questionReference == $_POST["enteringQuestion"]){
                                                $answerReference1 = new Answer($_POST["enteringAnswerKey1"], $_POST["enteringAnswerDetail1"]);
                                                $answerReference2 = new Answer($_POST["enteringAnswerKey2"], $_POST["enteringAnswerDetail2"]);
                                                $formReferer = $formReference->changeAnswerInQuestion($_POST["enteringQuestion"], $answerReference1, $answerReference2);
                                                $listForAll->replace("form", $formReference, $formReferer);
                                            }
                                        }
                                    }
                                }
                            }
                            elseif (isset($_POST["back7"])){
                                header("Location: main2.php");
                                exit();
                            }
                        }
                    }
                    elseif (isset($_POST["returnBack"])){
                        header("Location: main2.php");
                        exit();
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