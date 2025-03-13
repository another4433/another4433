<head>
    <meta charset="utf-8">
    <meta content="width=device-width; initial-scale=1.0">
    <title>Creating Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
</head>
<img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
<body id="formBody552">
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
    class Form {
        public int $ID = 0;
        public string $Name = "empty", $Owner = "empty";
        public DateTime $History;
        public function __construct($Name, $Owner){
            $this->Name = $Name;
            $this->Owner = $Owner;
            $this->ID = 1;
            $this->History = new DateTime();
        }
        public function getID(){
            return $this->ID;
        }
        public function setID($ID){
            $this->ID = $ID;
        }
        public function getName(){
            return $this->Name;
        }
        public function getOwner(){
            return $this->Owner;
        }
        public function getHistory(){
            return $this->History->format('Y-m-d H:i:s');
        }
    }
    class QandA {
        public int $ID = 0, $OwnerForm = 0;
        public string $Question;
        public DateTime $History;
        public function __construct($OwnerForm, $Question){
            $this->OwnerForm = $OwnerForm;
            $this->Question = $Question;
            $this->ID = 1;
            $this->History = new DateTime();
        }
        public function setID($ID){
            $this->ID = $ID;
        }
        public function getID(){
            return $this->ID;   
        }
        public function getOwnerForm(){
            return $this->OwnerForm;
        }
        public function getQuestion(){
            return $this->Question;
        }
        public function getHistory(){
            return $this->History->format('Y-m-d H:i:s');
        }
    }
    class Answers {
        public int $ID = 0, $OwnerForm = 0, $ReferQA = 0;
        public string $theKey = 'O', $Detail = "empty";
        public function __construct($OwnerForm, $theKey, $Detail, $ReferQA){
            $this->ID = 1;
            $this->OwnerForm = $OwnerForm;
            $this->theKey = $theKey;
            $this->Detail = $Detail;
            $this->ReferQA = $ReferQA;
        }
        public function setID($ID){
            $this->ID = $ID;
        }
        public function getID(){
            return $this->ID;
        }
        public function getOwnerForm(){
            return $this->OwnerForm;
        }
        public function getReferQA(){
            return $this->OwnerForm;
        }
        public function getTheKey(){
            return $this->theKey;
        }
        public function getDetail(){
            return $this->Detail;
        }
    }
    class Questions {
        public int $OwnerForm = 0;
        public string $theSpecific = "empty";
        public function __construct($theSpecific, $OwnerForm){
            $this->theSpecific = $theSpecific;
            $this->OwnerForm = $OwnerForm;
        }
        public function getOwnerForm(){
            return $this->OwnerForm;
        }
        public function getTheSpecific(){
            return $this->theSpecific;
        }
    }
    class Corrections {
        public int $answer = 0, $question = 0, $OwnerForm = 0, $identifier = 0;
        public DateTime $History;
        public function __construct($question, $answer, $OwnerForm){
            $this->answer = $answer;
            $this->question = $question;
            $this->identifier = 1;
            $this->OwnerForm = $OwnerForm;
            $this->History = new DateTime();
        }
        public function getHistory(){
            return $this->History->format('Y-m-d H:i:s');
        }
        public function getAnswer(){
            return $this->answer;
        }
        public function getQuestion(){
            return $this->question;
        }
        public function getOwnerForm(){
            return $this->OwnerForm;
        }
        public function getIdentifier(){
            return $this->identifier;
        }
        public function setIdentifier($identifier){
            $this->identifier = $identifier;
        }
    }
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
    $countForm = 1; $countIDQA = 0; $countIDA = 0; $countIDC = 0; $formCreated = false;
    if ($formCreated === false):
?>
        <div class="container">
            <form action="createForm.php" method="get">
                <label for="formName">Enter the name of the form: </label>
                <input type="text" name="formName" id="pFormName" value="Form<?=$countForm+1;?>"><br>
                <input type="submit" name="submit" id="pSubmit1" value="Submit">
            </form>
        </div><br>
<?php
    endif;
    try {
        $formPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
        if (isset($_GET["formName"]) && isset($_GET["submit"])){
            $formCreated = true;
            $theForm = new Form($_GET["formName"], $_SESSION["cpr"]);
            $operation = $formPDO->prepare("Insert Into Form Values (?, ?, ?, ?)");
            $theForm->setID($countForm);
            $operation->execute([$theForm->getID(), $theForm->getName(), $theForm->getHistory(), $theForm->getOwner()]);
            if ($operation->rowCount() > 0):
                $countForm = $countForm + 1;
?>
                <script>
                    alert("Successfully created form!");
                    console.warn("Data have been inserted in Form entity.");
                    console.time();
                </script>
                <div class="container">
                    <form action="createForm.php" method="get">
                        <label for="formAction">Choose an option below to start taking action about the form: <label>
                        <br><input type="radio" name="formAction" id="pFormAction1" value="Question">Add a question
                        <br><input type="radio" name="formAction" id="pFormAction2" value="Answer">Add an answer
                        <br><input type="radio" name="formAction" id="pFormAction3" value="Correction">Add correct answer for question
                        <br><input type="radio" name="formAction" id="pFormAction4" value="Cancel">Cancel action
                        <br><input type="submit" name="submit" id="pSubmit2" value="Confirm">
                    </form>
                </div><br>
<?php
                    try {
                        $thePDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                        if (isset($_GET["submit"]) && isset($_GET["formAction"])){
                            if ($_GET["formAction"] == "Question"):
?>
                                <div class="container">
                                    <form action="createForm.php" method="post">
                                        <div class="container">
                                            <label for="specific">Enter the question: </label>
                                            <input type="text" name="specific" id="specificQuestion" placeholder="Question must be related to Bahrain">
                                        </div><br>
                                        <div class="container">
                                            <br><label for="selectForm">Select the form to insert answer in: </label><br>
<?php 
                                                try {
                                                    $selectionMade = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                                    $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                                    foreach($ownerPDO as $own):
?>
                                                        <input type="radio" name="selectForm" id="pOwnnnn<?= $own["ID"];?>" value="<?=$own["ID"];?>">
                                                        <?php
                                                            echo $own["ID"].". ".$own["Name"]."<br>";
                                                    endforeach;
                                                }
                                                catch(PDOException $e){
                                                        ?>
                                                    <script>
                                                        alert("There's an error in the database.");
                                                        console.error("There's a bug in the code. Check it!");
                                                        console.info("The error came from the database.");
                                                    </script>
                                                    <?php
                                                        echo "Result: ".$e->getMessage()."<br>";
                                                }
                                                    ?>
                                        </div>
                                        <input type="submit" name="submit" id="pSubmit4" value="Submit">
                                    </form>
                                </div><br>
<?php
                                if (isset($_POST["selectForm"]) && isset($_POST["specific"]) && isset($_POST["submit"])){
                                    $question1 = new Questions($_POST["specific"], $_POST["selectForm"]);
                                    $question2 = new QandA($_POST["selectForm"], $_POST["specific"]);
                                    $operation1 = $thePDO->prepare("Insert Into Questions Values (?, ?)");
                                    $operation2 = $thePDO->prepare("Insert Into QandA Values (?, ?, ?, ?)");
                                    $question2->setID($countIDQA+1);
                                    $operation1->execute([$question1->getTheSpecific(), $question1->getOwnerForm()]);
                                    $operation2->execute([$question2->getID(), $question2->getQuestion(), $question2->getHistory(), $question2->getOwnerForm()]);
                                    if ($operation1->rowCount() > 0 && $operation2->rowCount() > 0):
                                        $countIDQA = $countIDQA + 1;
?>
                                        <script>
                                            alert("Successfully created question!");
                                            console.warn("Data have been inserted in Question and QandA entities.");
                                            console.time();
                                        </script>
<?php
                                        header("Location: main1.php");
                                        exit();
                                    else:
?>
                                        <script>
                                            alert("Failed to create a question!");
                                            console.error("There's a bug preventing data to be inserted into Question and QandA entities.");
                                        </script>
<?php
                                    endif;
                                }
                            elseif ($_GET["formAction"] == "Answer")
?>
                                <div class="container">
                                    <form action="createForm.php" method="post">
                                        <div class="container">
                                            <label for="key">Enter any letter for answer key: </label>
                                            <input type="text" name="key" id="answerKey1" value="O">
                                            <br><label for="detail">Enter the full answer detail: </label>
                                            <input type="text" name="detail" id="answerDetail1">
                                        </div>
                                        <div class="container">
                                            <br><label for="selectQA">Select the question to insert answer in: </label><br>
<?php 
                                            try {
                                                $selectionMade = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                                $ownerPDO = $selectingMade->query("Select ID, Question From QandA"); 
                                                foreach($ownerPDO as $own):
?>
                                                    <input type="radio" name="selectQA" id="pQAOwwwn<?= $own["ID"];?>" value="<?=$own["ID"];?>">
<?php
                                                    echo $own["ID"].". ".$own["Question"]."<br>";
                                                endforeach;
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
?>
                                        </div>
                                        <div class="container">
                                            <br><label for="selectForm">Select the form to insert answer in: </label><br>
<?php 
                                            try {
                                                $selectionMade = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                                $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                                foreach($ownerPDO as $own):
?>
                                                    <input type="radio" name="selectForm" id="pOwning<?= $own["ID"];?>" value="<?=$own["ID"];?>">
<?php
                                                    echo $own["ID"].". ".$own["Name"]."<br>";
                                                endforeach;
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
?>
                                        </div>
                                        <input type="submit" name="theSubmission" id="pSubmit8" value="Submit">
                                    </form>
                                </div><br>
<?php
                                try{
                                    $pdoAnswering = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                    if (isset($_POST["key"]) && isset($_POST["detail"]) && isset($_POST["selectQA"]) && isset($_POST["theSubmission"])){
                                        $pdoAnswer = $pdoAnswering->prepare("Insert Into Answers Values (?, ?, ?, ?, ?)");
                                        $answerClass = new Answers($_POST["selectForm"], $_POST["key"], $_POST["detail"], $_POST["selectQA"]);
                                        $answerClass->setID($countIDA+1);
                                        $pdoAnswer->execute([$answerClass->getID(), $answerClass->getTheKey(), $answerClass->getDetail(), $answerClass->getOwnerForm(), $answerClass->getReferQA()]);
                                        if ($pdoAnswer->rowCount() > 0):
                                            $countIDA = $countIDA + 1;
?>
                                            <script>
                                                alert("Successfully created answer!");
                                                console.warn("Data have been inserted in Answers entity.");
                                                console.time();
                                            </script>
<?php
                                            header("Location: main1.php");
                                            exit();
                                        else:
?>
                                            <script>
                                                alert("Failed to create a question!");
                                                console.error("There's a bug preventing data to be inserted into Answers entity.");
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
                            elseif ($_GET["formAction"] == "Correction"):
?>
                                <form action="createForm.php" method="post">
                                    <div class="container">
                                        <label for="selectQuestion">Select the question: </label><br> 
<?php
                                            try{
                                                $displayingPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                                $displayQuestion = $displayingPDO->query("Select ID, Question From QandA");
                                                foreach ($displayQuestion as $question):
?>
                                                    <input type="radio" name="selectQuestion" id="pQuestionn<?= $question["ID"];?>" value="<?=$question["ID"];?>">
<?php
                                                    echo $question["ID"].". ".$question["Question"]."<br>";
                                                endforeach;
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
?>
                                    </div>
                                    <div class="container">
                                        <label for="selectAnswer">Select the answer: </label><br> 
<?php
                                            try{
                                                $displayingPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                                $displayAnswer = $displayingPDO->query("Select ID, theKey, Detail From Answers");
                                                foreach ($displayAnswer as $answer):
?>
                                                    <input type="radio" name="selectAnswer" id="pAnswer<?= $answer["ID"];?>" value="<?=$answer["ID"];?>">
<?php
                                                    echo $answer["theKey"].". ".$answer["Detail"]."<br>";
                                                endforeach;
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
?>
                                    </div>
                                    <div class="container">
                                        <br><label for="selectForm">Select the form to insert correction in: </label><br>
<?php 
                                            try {
                                                $selectionMade = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                                $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                                foreach($ownerPDO as $own):
?>
                                                    <input type="radio" name="selectForm" id="pOwningg<?= $own["ID"];?>" value="<?=$own["ID"];?>">
<?php
                                                    echo $own["ID"].". ".$own["Name"]."<br>";
                                                endforeach;
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
?>
                                    </div>
                                    <input class="container" type="submit" name="submission" id="pSubmit10" value="Confirm">
                                </form><br>
<?php
                                try{
                                    $tryPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                                    if (isset($_POST["selectQuestion"]) && isset($_POST["selectAnswer"]) && isset($_POST["selectForm"]) && isset($_POST["submission"])){
                                        $correctClass = new Corrections($_POST["selectQuestion"], $_POST["selectAnswer"], $_POST["selectForm"]);
                                        $correctClass->setIdentifier($countIDC+1);
                                        $stmtCorrect = $tryPDO->prepare("Insert Into Corrections Values(?,?,?,?,?)");
                                        $stmtCorrect->execute([$correctClass->getAnswer(), $correctClass->getQuestion(), $correctClass->getOwnerForm(), $correctClass->getIdentifier(), $correctClass->getHistory()]);
                                        if ($stmtCorrect->rowCount() > 0):
                                            $countIDC = $countIDC + 1;
?>
                                            <script>
                                                alert("Successfully created correction!");
                                                console.warn("Data have been inserted in Corrections entity.");
                                                console.time();
                                            </script>
<?php
                                            header("Location: main1.php");
                                            exit();
                                        else:
?>
                                            <script>
                                                alert("Failed to create a correction!");
                                                console.error("There's a bug preventing data to be inserted into Corrections entity.");
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
                                    echo "Result: ".$e->getMessage();
                                }
                                catch(Exception $e){
?>
                                    <script>
                                        alert("There's an error in the application.");
                                        console.error("There's a bug in the code. Check it!");
                                    </script>        
<?php
                                }
                            else:
?>
                                <script>
                                    alert("Failed to create a form!");
                                    console.error("There's a bug preventing data to be inserted into Form entity.");
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
                        echo "Result: ".$e->getMessage();
                    }
                    catch(Exception $e){
?>
                        <script>
                            alert("There's an error in the application.");
                            console.error("There's a bug in the code. Check it!");
                        </script>
<?php 
                        echo "Result: ".$e->getMessage();
                    }
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
    }
?>