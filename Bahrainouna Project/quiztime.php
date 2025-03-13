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
<form action="quiztime.php" method="get">
    <div class="container">
        <label for="selectForm">Select the form to answer questions in it: </label>
        <?php
            try {
                $selectionMade = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                $ownerPDO = $selectionMade->query("SELECT * FROM Form");
                foreach($ownerPDO as $own):
        ?>
                    <input type="radio" name="selectForm" id="pOwnest<?= $own["ID"];?>" value="<?=$own["ID"];?>">
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
    <input class="container" type="submit" name="submission1" id="pSubmit100" value="Confirm">
</form><br>
<?php
    $showQuestions = null; $retrieved = null;
    try {
        $shower = null;
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
        $justDoPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
        if (isset($_GET["selectForm"]) && isset($_GET["submission1"]) && $_GET["submission1"] == "Confirm"){
            $showQuestions = $justDoPDO->prepare("SELECT * FROM QandA WHERE OwnerForm = ?");
            $showQuestions->execute([$_GET["selectForm"]]);
            $shower = $showQuestions->fetch();
            foreach ($shower as $realing):
                if ($realing != null || $shower != null):
                    $showAnswers = $justDoPDO->prepare("SELECT theKey, Detail FROM Answers WHERE OwnerForm = ? AND ReferQA = ?");
                    $showAnswers->execute([$_GET["selectForm"], $realing["ID"]]);
                    $retrieved = $showAnswers->fetch();
                    echo $realing["ID"].". ".$realing["Question"]."<br>";
                    foreach ($retrieved as $display):
                        echo $display["theKey"].". ".$display["Detail"]."<br>";
                    endforeach;
                endif;
?>
                <form action="quiztime.php" method="post">
                    <label for="labeling">Answer: </label>
                    <input type="text" name="labeling" id="pKey111" placeholder="Select any letter from above.">
                    <br><input type="submit" name="submission2" id="pSubmit111" value="Confirm">
                </form><br>
<?php
                try {
                    if (isset($_POST["labeling"]) && isset($_POST["submission2"]) && $retrieved != null){
                        $keyClass = new TheKeys($_POST["labeling"], $_GET["selectForm"]);
                        $keyPDO = $justDoPDO->prepare("INSERT INTO theKeys VALUES (?,?)");
                        $keyPDO->execute([$keyClass->getTheLetter(), $keyClass->getOwnerForm()]);
                        if ($keyPDO->rowCount() > 0):
?>
                            <script>
                                alert("Answer submitted successfully!");
                                console.warn("Data have been inserted in theKeys entity.");
                                console.time();
                            </script>
<?php
                        else:
?>
                            <script>
                                alert("Failed to submit the answer.");
                                console.error("Failed to insert data in theKeys entity.");
                            </script>
<?php
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
            endforeach;
?>
            <script>alert("Thank you for trying to answer the form!");</script>
<?php
        }
        $keysTotal = $justDoPDO->query("SELECT * FROM theKeys");
        $questionsTotal = $justDoPDO->query("SELECT * FROM QandA");
        if ($keysTotal->rowCount() >= $questionsTotal->rowCount()-1):
            if (isset($_GET["selectForm"]) && isset($_GET["submission1"]) && $shower != null && $showQuestions != null):
                $keyCollected = $justDoPDO->prepare("SELECT * FROM theKeys WHERE OwnerForm = ?");
                $keyCollected->execute([$_GET["selectForm"]]);
                $keysDisplays = $keyCollected->fetch();
                $questionsCollected = $justDoPDO->prepare("SELECT * FROM QandA WHERE OwnerForm = ?");
                $questionsCollected->execute([$_GET["selectForm"]]);
                $questionsDisplays = $questionsCollected->fetch();
                $answersCollected = null; $answersDisplays = null; $correctCollected = null; $correctDisplays = null; 
                if ($questionsDisplays["ID"] != null):
                    $answersCollected = $justDoPDO->prepare("SELECT * FROM Answers WHERE OwnerForm = ? AND ReferQA = ?");
                    $answersCollected->execute([$_GET["selectForm"], $questionsDisplays["ID"]]);
                    $answersDisplays = $answersCollected->fetch();
                    if ($answersDisplays["ID"] != null):
                        $correctCollected = $justDoPDO->prepare("SELECT * FROM Corrections WHERE answers = ? AND questions = ? AND OwnerForm = ?");
                        $correctCollected->execute([$answersDisplays["ID"], $questionsDisplays["ID"], $_GET["selectForm"]]);
                        $correctDisplays = $correctCollected->fetch();
                    endif;
                endif;
                if (isset($keysDisplays) && isset($questionsDisplays) && isset($answersDisplays) && isset($correctDisplays)):
                    if ($answersDisplays != null && $correctDisplays != null):
                        $founderQ = ""; $founderA = ""; $founderK = ""; $countGot = 0; $countTotal = 0;
                        foreach ($correctDisplays as $corrected):
                            foreach ($questionsDisplays as $questioned){
                                if ($corrected["questions"] == $questioned["ID"]){
                                    $founderQ = $questioned;
                                    break;
                                }
                            }
                            foreach ($answersDisplays as $answered){
                                foreach ($keysDisplays as $keyD){
                                    if ($keyD["theLetter"] == $answered["theKey"]){
                                        $founderK = $keyD["theLetter"];
                                        break;
                                    }
                                }
                                if ($answered["ID"] == $corrected["answers"]){
                                    $founderA = $answered;
                                    break;
                                }
                            }
                            if ($founderQ != "" && $founderA != "" && $founderK != ""){
                                if ($corrected["answer"] == $founderA["ID"] && $corrected["question"] == $founderQ["ID"]){
                                    if ($founderA["theKey"] == $founderK):
                                        $countGot = $countGot + 1;
                                    endif;
                                }
                            }
                        endforeach;
                        echo "<br>Your score = ".$countGo."/".$countTotal."<br>";
                    else:
?>
                        <script>
                            alert("Your answers have not been corrected.");
                            console.log("Database couldn't be accessed for correcting answers.");
                        </script>
<?php
                    endif;
                endif;
            endif;
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