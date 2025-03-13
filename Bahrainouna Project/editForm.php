<head>
    <meta charset="utf-8">
    <meta content="width=device-width; initial-scale=1.0">
    <title>Creating Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
</head>
<img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
<body id="formBody554">
    <h3 align="center">Choose an option below to start action in this website:</h3><br>
    <nav class="container">
        <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
        <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account-->
        <button id="questions">Quiz</button> <!--Answer Form-->
        <button id="logout">Logout</button> <!--Logout-->
    </nav><br>
    <script src="main1.js">console.log("The rest of the code started from the javascript file.");</script>
</body>
<form action="editForm.php" method="get">
    <div class="container">
        <label for="selectForm">Select the form to edit it: </label>
        <?php
            try {
                if (!isset($_SESSION) || !isset($_SESSION["cpr"])){
                    session_start();
                    $sessionPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                    $sessionInserter = $sessionPDO->query("SELECT * FROM Login");
                    $counter = $sessionInserter->rowCount();
                    foreach ($sessionInserter as $mySession){
                        $counting = 0;
                        if ($counting == ($counter-1)){
                            $_SESSION["cpr"] = $mySession["CPR"];
                        }
                    }
                }
                $selectionMade = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                $ownerPDO = $selectionMade->query("SELECT ID, Name FROM Form");
                foreach($ownerPDO as $own):
        ?>
                    <input type="radio" name="selectForm" id="pOwnenenst<?= $own["ID"];?>" value="<?=$own["ID"];?>">
        <?php
                    echo $own["ID"].". ".$own["Name"]."<br>";
                endforeach;
            }
            catch(PDOException $e){
        ?>
                <script>
                    alert("There's an error in the database.");
                    console.error("There's a bug in the code. Check it!")
                </script>
        <?php
                echo "Result: ".$e->getMessage()."<br>";
            }
        ?>
    </div>
    <input class="container" type="submit" name="submission3" id="pSubmit222" value="Confirm">
</form><br>
<?php
    //Corrections remaining to edit
    try {
        if (isset($_GET["selectForm"]) && isset($_GET["submission3"])){
            $editorPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
            $viewQandA = $editorPDO->prepare("SELECT ID, Question FROM qanda WHERE OwnerForm = :owner99");
            $viewQandA->bindParam(':owner99', $_GET["selectForm"]);
            $viewQandA->execute();
            $viewQuestions = $viewQandA->fetch();
?>
            <form action="editForm.php" method="get">
                <div class="container">
                    <label for="selectQA">Select the question to be edited: </label><br>
                    <?php
                        foreach ($viewQuestions as $question):
                    ?>
                            <input type="radio" name="selectQA" id="pQAOwn<?= $question["ID"];?>" value="<?=$question["ID"];?>">
                    <?php
                            echo " ".$question["ID"].". ".$question["Question"]."<br>";
                        endforeach;
                    ?>
                    <input type="radio" name="selectQA" id="pRefusal1" value="-1">Cancel.<br>
                    <input type="submit" name="submission2" id="pSubmitting123" value="Confirm">
                </div>
            </form><br>
<?php
            if (isset($_GET["selectQA"]) && isset($_GET["submission2"]) && $_GET["submission2"] == "Confirm"):
                if ($_GET["selectQA"] == "-1"):
                    header("Location: main1.php");
                    exit();
                else: 
?>
                    <div class="container">
                        <form action="editForm.php" method="post">
                            <label for="changeQuestion">Do you want to rename the question?</label>&nbsp;&nbsp;
                            <input type="radio" name="changeQuestion" id="MeAsking1" value="true">Yes&nbsp;&nbsp;
                            <input type="radio" name="changeQuestion" id="MeAsking2" value="false">No&nbsp;&nbsp;
                            <input type="submit" name="submission0" id="pSubmit333" value="Confirm">
                        </form>
                    </div><br>
<?php
                    if (isset($_POST["changeQuestion"]) && isset($_POST["submission0"])):
                        if ($_POST["changeQuestion"] == "true"):
                            $questionsViewer = $editorPDO->prepare("SELECT Q.theSpecific FROM qanda A, questions Q WHERE Q.OwnerForm = :owner77 AND Q.theSpecific = A.Question");
                            $questionsViewer->bindParam(':owner77', $_GET["selectForm"]);
                            $questionsViewer->execute();
                            $questionsCollected = $questionsViewer->fetch();
?>
                            <div class="container">
                                <form action="editForm.php" method="post">
                                    <label for="questionEditor">Enter the new question: </label>
                                    <input type="text" name="questionEditor" id="pEditQuestion1" placeholder="New question preferable">
                                </form>
                            </div><br>
<?php
                            $questionChange1 = $editorPDO->prepare("UPDATE questions SET theSpecific = ? WHERE OwnerForm = ? AND theSpecific = ?");
                            $questionChange1->execute([$_POST["questionEditor"], $_GET["selectForm"], $questionsCollected]);
                            $questionChange2 = $editorPDO->prepare("UPDATE qanda SET Question = ? WHERE ID = ? AND OwnerForm = ?");
                            $questionChange2->execute([$_POST["questionEditor"], $_POST["selectQA"], $questionsCollected]);
                            if ($questionChange1->rowCount() > 0 && $questionChange2->rowCount() > 0):
?>
                                <script> 
                                    alert("Question have been renamed successfully!");
                                    console.warn("A change occured in both question and qanda entities.");
                                    console.time();
                                </script>
<?php
                                header("Location: editForm.php");
                                exit();
                            else: 
?>
                                <script> 
                                    alert("Failed to rename the question.");
                                    console.error("There's a bug when making changes to question and qanda entities.");
                                </script>
<?php
                            endif;
                        else:
                            $viewAnswers = $editorPDO->prepare("SELECT ID, theKey, Detail FROM answers WHERE OwnerForm = ? AND ReferQA = ?");
                            $viewAnswers->execute([$_GET["selectForm"], $_GET["selectQA"]]);
                            $collectAnswers = $viewAnswers->fetch();
                            foreach ($collectAnswers as $answer):
?>
                                <div class="container"> 
                                    <form action="editForm.php" method="get">
                                        <label for="answerAction">Select the answer to be edited: </label><br>
                                        <input type="radio" name="answerAction" id="pAnswerers<?= $answer["ID"];?>" value="<?=$answer["ID"];?>">
                                        <?php
                                            echo $answer["theKey"].". ".$answer["Detail"]."<br>";
                                        ?>
                                        <input type="radio" name="answerAction" id="pAnswerersCancel1" value="-1">Cancel. <br>
                                        <input type="submit" name="submission1" id="pSubmit444" value="Confirm">
                                    </form>
                                </div><br>
<?php
                            endforeach;
                            if (isset($_GET["answerAction"]) && isset($_GET["submission1"]) && $_GET["submission1"] == "Confirm"):
                                if ($_GET["answerAction"] == "-1"):
                                    header("Location: main1.php");
                                    exit();
                                else:
?>
                                    <div class="container">
                                        <form action="editForm.php" method="post">
                                            <label for="askingAnswerEditor">Do you want to rename the answer?</label>&nbsp;&nbsp;
                                            <input type="radio" name="askingAnswerEditor" id="MeAsking3" value="true">Yes&nbsp;&nbsp;
                                            <input type="radio" name="askingAnswerEditor" id="MeAsking4" value="false">No&nbsp;&nbsp;
                                            <input type="submit" name="submission-1" id="pSubmit555" value="Confirm">
                                        </form>
                                    </div><br>
<?php
                                    if (isset($_POST["askingAnswerEditor"]) && isset($_POST["submission-1"]) && $_POST["submission-1"] == "Confirm"):
                                        if ($_POST["askingAnswerEditor"] == "true"):
?>
                                            <div class="container">
                                                <form action="editForm.php" method="post">
                                                    <label for="elementSelection">Select the followings to be edited:</label>&nbsp;&nbsp;
                                                    <input type="checkbox" name="elementSelection" id="pElementSelect1" value="KEY">&nbsp;&nbsp;
                                                    <input type="checkbox" name="elementSelection" id="pElementSelect2" value="DETAIL">&nbsp;&nbsp;
                                                    <input type="submit" name="submission4" id="pSubmit999" value="Confirm">
                                                </form>
                                            </div><br>
<?php
                                            if (isset($_POST["elementSelection"]) && isset($_POST["submission4"])):
                                                switch ($_POST["elementSelection"]){
                                                    case "KEY": {
?>
                                                        <div class="container">
                                                            <form action="editForm.php" method="post">
                                                                <label for="editKEY">Enter a new key for the answer: </label>&nbsp;&nbsp;
                                                                <input type="text" name="editKEY" id="peditKEY" value="A">&nbsp;&nbsp;
                                                                <input type="submit" name="submission5" id="pSubmit888" value="Submit"> 
                                                            </form>
                                                        </div><br>
<?php
                                                        if (isset($_POST["editKEY"]) && isset($_POST["submission5"])):
                                                            $editKey = $editorPDO->prepare("UPDATE answer SET theKey = ? WHERE ID = ? AND OwnerForm = ? AND ReferQA = ?");
                                                            $editKey->execute([$_POST["editKEY"], $_GET["answerAction"], $_GET["selectForm"], $_GET["selectQA"]]);
                                                            if ($editKey->rowCount() > 0):
?>
                                                                <script>
                                                                    alert("Answer key have been modified successfully!");
                                                                    console.warn("A change occured in the answer entitiy");
                                                                    console.time();
                                                                </script>
<?php
                                                            else:
?>
                                                                <script>
                                                                    alert("Failed to modify the answer key.");
                                                                    console.error("There's a bug when trying to make changes in the answer entity.");
                                                                </script>
<?php
                                                            endif;
                                                        endif;
                                                        break;
                                                    }
                                                    case "DETAIL": {
?>
                                                        <div class="container">
                                                            <form action="editForm.php" method="post">
                                                                <label for="editDETAIL">Enter the new answer detail: </label>&nbsp;&nbsp;
                                                                <input type="text" name="editDETAIL" id="pDETAILEdit1" placeholder="Most likey different answer"><br>
                                                                <input type="submit" name="submission9" id="pSubmit777" value="Submit">
                                                            </form>
                                                        </div><br>
<?php
                                                        if (isset($_POST["editDETAIL"]) && isset($_POST["submission9"])):
                                                            $editDetail = $editorPDO->prepare("UPDATE answer SET Detail = ? WHERE ID = ? AND OwnerForm = ? AND ReferQA = ?");
                                                            $editDetail->execute([$_POST["editDETAIL"], $_GET["answerAction"], $_GET["selectForm"], $_GET["selectQA"]]);
                                                        endif;
                                                        break;
                                                    }
                                                    default: {
?>
                                                        <div class="container">
                                                            <form action="editForm.php" method="post">
                                                                <label for="editKEY">Enter a new key and detail for the answer: </label><br>
                                                                <input type="text" name="editKEY" id="peditKEY2" placeholder="Key">&nbsp;&nbsp;
                                                                <input type="text" name="editDETAIL" id="peditDETAIL2" placeholder="Detail">&nbsp;&nbsp;
                                                                <input type="submit" name="submission6" id="pSubmit9999" value="Submit"> 
                                                            </form>
                                                        </div><br>
<?php
                                                        if (isset($_POST["editKEY"]) && isset($_POST["editDETAIL"]) && isset($_POST["submission6"])):
                                                            $editBOTH = $editorPDO->prepare("UPDATE answer SET theKey = ? AND Detail = ? WHERE ID = ? AND OwnerForm = ? AND ReferQA = ?");
                                                            $editBOTH->execute([$_POST["editKEY"], $_POST["editDETAIL"], $_GET["answerAction"], $_GET["selectForm"]. $_GET["selectQA"]]);
                                                            if ($editBOTH->rowCount() > 0):
?>
                                                                <script>
                                                                    alert("Answer key and detail have been successfully modified!");
                                                                    console.warn("A change occured in the answer entity.");
                                                                    console.time();
                                                                </script>
<?php
                                                            else:
?>
                                                                <script>
                                                                    alert("Failed to modify answer key and detail.");
                                                                    console.error("There's a bug when trying to modify answer entitiy.");
                                                                </script>
<?php
                                                            endif;
                                                        endif;
                                                    }
                                                }
                                                header("Location: editForm.php");
                                                exit();
                                            endif;
                                        else:
?>
                                            <div class="container">
                                                <form action="editForm.php" method="post">
                                                    <label for="askEditCorrection">Do you want to edit the corrections in this form?</label>&nbsp;&nbsp;
                                                    <input type="radio" name="askEditCorrection" id="pEditCorrect1" value="true">Yes&nbsp;&nbsp;
                                                    <input type="radio" name="askEditCorrection" id="pEditCorrect2" value="false">No&nbsp;&nbsp;
                                                    <input type="submit" name="submission99" id="pSubmit99999" value="Confirm">
                                                </form>
                                            </div><br>
<?php
                                            if (isset($_POST["askEditCorrection"]) && isset($_POST["submission99"])):
                                                if ($_POST["askEditCorrection"] == "false"):
?>
                                                    <script>
                                                        alert("Thank you for making changes in this form!");
                                                        alert("Now heading back to the homepage...");
                                                        console.info("The user already visited editing form page, so this user will go back to the main page.");
                                                    </script>
<?php
                                                    header("Location: main1.php");
                                                    exit();
                                                else:
?>
                                                    <div class="container">
                                                        <form action="editForm.php" method="post">
                                                            <!-- Here you will make a loop of corrections for user to select then continue with the code -->
                                                        </form>
                                                    </div>
<?php
                                                endif;
                                            endif;
                                        endif;
                                    endif;
                                endif;
                            endif;
                        endif;
                    endif;
                endif;
            endif;
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