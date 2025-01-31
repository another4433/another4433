let countIDQA = 0, countIDA = 0, countForm = 0, countIDC = 0;
const form = document.getElementById("theForm");
const account = document.getElementById("theUser");
const answers = document.getElementById("answers");
const questions = document.getElementById("questions");
form.addEventListener('mouseover', () => {
    console.warn("Form button have been hovered.");
    form.style.background = "white";
    form.style.text = "white";
});
account.addEventListener('mouseover', () => {
    console.warn("Account button have been hovered.");
    account.style.background = "white";
    account.style.text = "white";
});
answers.addEventListener('mouseover', () =>{
    console.warn("Answer button have been hovered.");
    answers.style.background = "white";
    answers.style.text = "white";
});
questions.addEventListener('mouseover', () => {
    console.warn("Question button have been hovered.");
    questions.style.background = "white";
    questions.style.text = "white";
});
form.addEventListener('click', () => {
    console.warn("Form button have been clicked.");
    console.time();
    document.getElementsByTagName("body").innerHTML = `
        <h3>Choose an option below to start action in this website:</h3><br>
        <nav class="container">
            <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Answer Form-->
            <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, Logout-->
            <button id="questions">Show questions</button>&nbsp;&nbsp;
            <button id="answers">Show answers</button>
        </nav><br>
        <div class="container">
            <form action="main.php" method="get">
                <label for="forming">Choose option below to take action about the form: </label>
                <br><input type="radio" name="forming" id="pForming1" value="Create Form">Create a form
                <br><input type="radio" name="forming" id="pForming2" value="Delete Form">Delete a form
                <br><input type="radio" name="forming" id="pForming3" value="Edit Form">Edit a form
                <br><input type="radio" name="forming" id="pForming4" value="Answer Form">Answer questions in a form
                <br><input type="radio" name="forming" id="pForming5" value="Cancel">Cancel action
                <br><input type="submit" name="submit" id="pSubmit3" value="Confirm">
            </form>
        <div><br>
        <?php
            if (isset($_GET["forming"])){
                if ($_GET["forming"] == "Create a Form"): 
        ?>
                    <div class="container>
                        <form action="main.php" method="get">
                            <label for="formName">Enter the name of the form: </label>
                            <input type="text" name="formName" id="pFormName" value="Form #${countForm+1}"><br>
                            <input type="submit" name="submit" id="pSubmit1" value="Submit">
                        </form>
                    </div><br>
        <?php
                    try {
                        $formPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                        if (isset($_GET["formName"]) && isset($_GET["submit"])){
                            $theForm = new Form($_GET["formName"], $SESSION["cpr"]);
                            $operation = $formPDO->prepare("Insert Into Form Values (?, ?, ?, ?));
                            $theForm->setID(${countForm+1});
                            $operation->execute([$theForm->getID(), $theForm->getName(), $theForm->getHistory(), $theForm->getOwner()]);
                            if ($operation->rowCount() > 0):
        ?>
                                <script>
                                    countForm = countForm + 1;
                                    alert("Successfully created form!");
                                    console.warn("Data have been inserted in Form entity.");
                                    console.time();
                                </script>
                                <div class="container">
                                    <form action="main.php" method="get">
                                        <label for="formAction">Choose an option below to start taking action about the form: <label>
                                        <br><input type="radio" name="formAction" id="pFormAction1" value="Question">Add a question
                                        <br><input type="radio" name="formAction" id="pFormAction2" value="Answer">Add an answer
                                        <br><input type="radio" name="formAction" id="pFormAction3" value="Correction">Add correct answer for question
                                        <br><input type="radio" name="formAction" id="pFormAction4" value="Cancel">Cancel action
                                        <br><input type="submit" name="submit" id="pSubmit2" value="Confirm">
                                    </form>
                                <div><br>
                                <?php
                                    try {
                                        $thePDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                        if (isset($_GET["formAction"])){
                                            if ($_GET["formAction"] == "Question"):
                                ?> 
                                                <div class="container">
                                                    <form action="main.php" method="post">
                                                        <div class="container">
                                                            <label for="specific">Enter the question: </label>
                                                            <input type="text" name="specific" id="specificQuestion" placeholder="Question must be related to Bahrain">
                                                        </div><br>
                                                        <div class="container">
                                                            <br><label for="selectForm">Select the form to insert answer in: </label><br>
                                                            <?php 
                                                                try {
                                                                    $selectionMade = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                                    $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                                                    foreach($ownerPDO as $own):
                                                            ?>
                                                                        <input type="radio" name="selectForm" id="pOwning<?= $own["ID"]?>" value="<?=$own["ID"]?>">
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
                                                        <input type="submit" name="submit" id="pSubmit4" value="Submit">
                                                    </form>
                                                </div><br>
                                <?php
                                                if (isset($_POST["selectForm"]) && isset($_POST["specific"]) && isset($_POST["submit"])){
                                                    $question1 = new Question($_POST["specific"], $_POST["selectForm"]);
                                                    $question2 = new QandA($_POST["selectForm"], $_POST["specific"]);
                                                    $operation1 = $thePDO->prepare("Insert Into Questions Values (?, ?)");
                                                    $operation2 = $thePDO->prepare("Insert Into QandA Values (?, ?, ?, ?)");
                                                    $question2->setID(${countIDQA+1});
                                                    $operation1->execute([$question1->getTheSpecific(), $question1->getOwnerForm()]);
                                                    $operation2->execute([$question2->getID(), $question2->getQuestion, $question2->getHistory(), $question2->getOwnerForm()]);
                                                    if ($operation1->rowCount() > 0 && $operation2->rowCount > 0):
                                ?>
                                                        <script>
                                                            countIDQA = countIDQA + 1;
                                                            alert("Successfully created question!");
                                                            console.warn("Data have been inserted in Question and QandA entities.");
                                                            console.time();
                                                        </script>
                                <?php
                                                        header("Location: main.php");
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
                                            elseif ($_GET["formAction"] == "Answer"):
                                ?>
                                                <div class="container">
                                                    <form action="main.php" method="post">
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
                                                                    $selectionMade = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                                    $ownerPDO = $selectingMade->query("Select ID, Question From QandA"); 
                                                                    foreach($ownerPDO as $own):
                                                            ?>
                                                                        <input type="radio" name="selectQA" id="pQA<?= $own["ID"]?>" value="<?=$own["ID"]?>">
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
                                                                    $selectionMade = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                                    $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                                                    foreach($ownerPDO as $own):
                                                            ?>
                                                                        <input type="radio" name="selectForm" id="pOwning<?= $own["ID"]?>" value="<?=$own["ID"]?>">
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
                                                    $pdoAnswering = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                    if (isset($_POST["key"]) && isset($_POST["detail"]) && isset($_POST["selectQA"]) && isset($_POST["theSubmission"])){
                                                        $pdoAnswer = $pdoAnswering->prepare("Insert Into Answers Values (?, ?, ?, ?, ?)");
                                                        $answerClass = new Answers($_POST["selectForm"], $_POST["key"], $_POST["detail"], $_POST["selectQA"]);
                                                        $answerClass->setID(${countIDA});
                                                        $pdoAnswer->execute([$answerClass->getID(), $answerClass->getTheKey(), $answerClass->getDetail(), $answerClass->getOwnerForm(), $answerClass->getReferQA()]);
                                                        if ($pdoAnswer->rowCount() > 0):
                                ?>
                                                            <script>
                                                                countIDA = countIDA + 1;
                                                                alert("Successfully created answer!");
                                                                console.warn("Data have been inserted in Answers entity.");
                                                                console.time();
                                                            </script>
                                <?php
                                                            header("Location: main.php");
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
                                                <form action="main.php" method="post">
                                                    <div class="container">
                                                        <label for="selectQuestion">Select the question: </label><br> 
                                                        <?php
                                                            try{
                                                                $displayingPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                                $displayQuestion = $displayingPDO->query("Select ID, Question From QandA");
                                                                foreach ($displayQuestion as $question):
                                                        ?>
                                                                    <input type="radio" name="selectQuestion" id="pQuestion<?= $question["ID"]?>" value="<?=$question["ID"]?>">
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
                                                                $displayingPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                                $displayAnswer = $displayingPDO->query("Select ID, theKey, Detail From Answers");
                                                                foreach ($displayAnswer as $answer):
                                                        ?>
                                                                    <input type="radio" name="selectAnswer" id="pAnswer<?= $answer["ID"]?>" value="<?=$answer["ID"]?>">
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
                                                                $selectionMade = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                                $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                                                foreach($ownerPDO as $own):
                                                        ?>
                                                                    <input type="radio" name="selectForm" id="pOwning<?= $own["ID"]?>" value="<?=$own["ID"]?>">
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
                                                    $tryPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                                    if (isset($_POST["selectQuestion"]) && isset($_POST["selectAnswer"]) && isset($_POST["selectForm"]) && isset($_POST["submission"])){
                                                        $correctClass = new Corrections($_POST["selectQuestion"], $_POST["selectAnswer"], $_POST["selectForm"]);
                                                        $correctClass->setIdentifier(${countIDC+1});
                                                        $stmtCorrect = $tryPDO->prepare("Insert Into Corrections Values(?,?,?,?,?)");
                                                        $stmtCorrect->execute([$correctClass->getAnswer(), $correctClass->getQuestion(), $correctClass->getOwnerForm(), $correctClass->getIdentifier(), $correctClass->getHistory()]);
                                                        if ($stmtCorrect->rowCount() > 0):
                                ?>
                                                            <script>
                                                                countIDC = countIDC + 1;
                                                                alert("Successfully created correction!");
                                                                console.warn("Data have been inserted in Corrections entity.");
                                                                console.time();
                                                            </script>
                                <?php
                                                            header("Location: main.php");
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
                                            endif;
                                        }
                                    }
                                ?>
        <?php
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
                        echo "Result: ".$e->getMessage()"<br>";                 
                    }
                    catch(Exception $e){
        ?> 
                        <script>
                            alert("There's an error in the application.");
                            console.error("There's a bug in the code. Check it!");
                        </script>
        <?php
                        echo "Result: ".$e->getMessage()"<br>";
                    }
                elseif ($_GET["forming"] == "Delete a Form"):
        ?>
                    <form action="main.php" method="get">
                        <div class="container">
                            <label for="selectForm">Select the form to delete: </label>
                            <?php 
                                try {
                                    $selectionMade = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                    $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                    foreach($ownerPDO as $own):
                            ?>
                                        <input type="radio" name="selectForm" id="pOwnering<?= $own["ID"]?>" value="<?=$own["ID"]?>">
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
                        <input class="container" type="submit" name="submission" id="pSubmit9" value="Confirm">
                    </form><br>
        <?php
                    try {
                        $deletePDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                        if (isset($_GET["selectForm"])){ 
                            $deleteCorrections = $deletePDO->prepare("Delete From Corrections Where OwnerForm = :owner1");
                            $deleteCorrections->bindParam(':owner1', $_GET["selectForm"]);
                            $deleteCorrections->execute();
                            $deleteKey = $deletePDO->prepare("Delete From theKeys Where OwnerForm = :owner2");
                            $deleteKey->bindParam(':owner2', $_GET["selectForm"]);
                            $deleteKey->execute();
                            $deleteQuestions = $deletePDO->prepare("Delete From Questions Where OwnerForm = :owner3");
                            $deleteQuestions->bindParam(':owner3', $_GET["selectForm"]);
                            $deleteQuestions->execute();
                            $deleteAnswers = $deletePDO->prepare("Delete From Answers Where OwnerForm = :owner4");
                            $deleteAnswers->bindParam(':owner4', $_GET["selectForm"]);
                            $deleteAnswers->execute();
                            $deleteQandA = $deletePDO->prepare("Delete From QandA Where OwnerForm = :owner5");
                            $deleteQandA->bindParam(':owner5', $_GET["selectForm"]);
                            $deleteQandA->execute();
                            $deleteForm = $deletePDO->prepare("Delete From Form Where ID = :realForm");
                            $deleteForm->bindParam(':realForm', $_GET["selectForm"]);
                            $deleteForm->execute();
                            if ($deleteForm->rowCount() > 0):
        ?>
                                <script>
                                    alert("The form have been successfully deleted!");
                                    console.warn("Data have been removed from Form, Questions, Answers, QandA, Corrections, and Form entities.");
                                    console.time();
                                </script>
        <?php
                                header("Location: main.php");
                                exit();
                            else: 
        ?>
                                <script>
                                    alert("Failed to delete the Form! Form not found.");
                                    console.error("Data have not been removed from Form, Questions, Answers, QandA, Corrections, and Form entities.");
                                    console.info("The FormID was not found in Form, Questions, Answers, QandA, Corrections, and Form entities.");
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
                elseif ($_GET["forming"] == "Edit a Form"):
        ?>
                    <script>alert("Option Unavailable.");</script>
        <?php
                elseif ($_GET["forming"] == "Answer questions in a form"):
        ?>
                    <form action="main.php" method="get">
                        <div class="container">
                            <label for="selectForm">Select the form to answer questions in it: </label>
                            <?php 
                                try {
                                    $selectionMade = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                    $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                                    foreach($ownerPDO as $own):
                            ?>
                                        <input type="radio" name="selectForm" id="pOwnest<?= $own["ID"]?>" value="<?=$own["ID"]?>">
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
                        <input class="container" type="submit" name="submission1" id="pSubmit10" value="Confirm">
                    </form><br>
        <?php
                    try {
                        $justPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                        if (isset($_GET["selectForm"]) && isset($_GET["submission1"])){
                            $showQuestions = $justPDO->prepare("Select ID, Question From QandA Where OwnerForm = :owner6");
                            $showQuestions->bindParam(':owner6', $_GET["selectForm"]);
                            $showQuestions->execute();
                            $shower = $showQuestions->fetch();
                            foreach ($shower as $realing):
                                $showAnswers = $justPDO->prepare("Select theKey, Details From Answers Where OwnerForm = ? And ReferQA = ?);
                                $showAnswers->execute([$_GET["selectForm"], $realing["ID"]]);
                                $retrieved = $showAnswers->fetch();
                                echo $realing["ID"].". ".$realing["Question"]."<br>";
                                foreach ($retrieved as $display){
                                    echo $display["theKey"].". ".$display["Details"]."<br>";
                                }
        ?>
                                <form action="main.php" method="post">
                                    <label for="labeling">Answer: </label><br>
                                    <input type="text" name="labeling" id="pKey11" placeholder="Select any letter from above.">
                                    <br><input type="submit" name="submission2" id="pSubmit11" value="Confirm">
                                </form><br>
        <?php
                                try {
                                    if (isset($_POST["labeling"]) && isset($_POST["submission2"])){
                                        $keyClass = new TheKeys($_POST["labeling"], $_GET["selectForm"]);
                                        $keyPDO = $justPDO->prepare("Insert Into theKeys Values (?,?)");
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
                                            <script>
                                                alert("Failed to submit the answer.");
                                                console.error("Failed to insert data in theKeys entity.");
                                            </script>
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
                            $keysCollected = $justPDO->prepare("Select * From theKeys Where OwnerForm = :owner7");
                            $keysCollected->bindParam(':owner7', $_GET["selectForm"]);
                            $keysCollected->execute();
                            $keysDisplays = $keysCollected->fetch();
                            $questionsCollected = $justPDO->prepare("Select * From QandA Where OwnerForm = :owner8");
                            $questionsCollected->bindParam(':owner8', $_GET["selectForm"]);
                            $questionsCollected->execute();
                            $questionsDisplays = $questionsCollected->fetch();
                            $answersCollected = $justPDO->prepare("Select * From Answers Where OwnerForm = ? And ReferQA = ?");
                            $answersCollected->execute([$_GET["selectForm"], $questionsDisplays["ID"]]);
                            $answersDisplays = $answersCollected->fetch();
                            $correctCollected = $justPDO->prepare("Select * From Corrections Where answers = ? And questions = ? And OwnerForm = ?");
                            $correctCollected->execute([$answersDisplays["ID"], $questionsDisplays["ID"], $_GET["selectForm"]]);
                            $correctDisplays = $correctCollected->fetch();
                            if (isset($keysDisplays) && isset($correctDisplays)):
                                $founderQ = "", $founderA = "", $founderK = "";
                                $countGot = 0; $countTotal = 0;
                                foreach ($correctDisplays as $corrected){
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
                                    if (founderQ != "" && founderA != "" && founderK != ""){
                                        if ($corrected["answer"] == $founderA["ID"] && $corrected["question"] == $founderQ["ID"]){
                                            if ($founderA["theKey"] == $founderK){
                                                $countGot = $countGot + 1;
                                            }
                                        }
                                    }
                                    $countTotal = $countTotal + 1;
                                }
                                echo "<br>Your score = ".$countGo."/".$countTotal."<br>";
                            else:
        ?>
                                <script>
                                    alert("Your answers have not been corrected");
                                    console.log("Database couldn't to be accessed for correcting answers");
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
                        echo "Result: "$e->getMessage()."<br>";
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
                endif;
            }
        ?>
    `;
});
questions.addEventListener('click', () => {
    console.warn("Question button have been clicked.");
    console.time();
    document.getElementsByTagName("body") = `
        <body>
            <h3>Choose an option below to start action in this website:</h3><br>
            <nav class="container">
                <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Answer Form-->
                <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, Logout-->
                <button id="questions">Show questions</button>&nbsp;&nbsp;
                <button id="answers">Show answers</button>
            </nav><br>
            <table class="pico">
                <tr>
                    <th>Question</th>
                    <th>Form ID referred to</th>
                </tr>
                <?php
                    try {
                        $displayPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                        $displayResults = $displayPDO->query("Select * From Questions");
                        foreach ($displayResults as $row):
                ?>
                            <tr>
                                <td><?= $row['theSpecific'] ?></td>
                                <td><?= $row['OwnerForm'] ?></td>
                            </tr>
                <?php
                        endforeach;
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
                ?>
            </table>
        </body>
    `;
});
answers.addEventListener('click', () => {
    console.warn("Answer button have been clicked.");
    console.time();
    document.getElementsByTagName("body") = `
        <body>
            <h3>Choose an option below to start action in this website:</h3><br>
                <nav class="container">
                <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Answer Form-->
                <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, Logout-->
                <button id="questions">Show questions</button>&nbsp;&nbsp;
                <button id="answers">Show answers</button>
            </nav><br>
            <table class=pico>
                <tr>
                    <th>ID</th>
                    <th>Key</th>
                    <th>Detail</th>
                    <th>Form ID referred to</th>
                    <th>Question ID referred to</th>
                </tr>
                <?php
                    try {
                        $displayPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                        $displayAnswers = $displayPDO->query("Select * From Answers");
                        foreach ($displayAnswers as $line):
                ?>
                            <tr>
                                <td><?= $line["ID"] ?></td>
                                <td><?= $line["theKey"] ?></td>
                                <td><?= $line["Detail"] ?></td>
                                <td><?= $line["OwnerForm"] ?></td>
                                <td><?= $line["ReferQA"] ?></td>
                            </td>
                <?php
                        endforeach;
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
                ?>
        </body>
    `;
});
account.addEventListener('click', () => {
    console.warn("Account button have been clicked.");
    console.time();
    document.getElementsByTagName("body") = `
        <body>
            <h3>Choose an option below to start action in this website:</h3><br>
            <nav class="container">
                <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Answer Form-->
                <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, Logout-->
                <button id="questions">Show questions</button>&nbsp;&nbsp;
                <button id="answers">Show answers</button>
            </nav><br>
            <div class="container">
                <form action="main.php" method="get">
                    <label for="userAction">Choose an option below to start the action: </label>
                    <br><input type="radio" name="userAction" id="pUserAction1" value="Delete User">Delete an account
                    <br><input type="radio" name="userAction" id="pUserAction2" value="Edit User">Edit an account
                    <br><input type="radio" name="userAction" id="pUserAction3" value="Logout">Logout
                    <br><input type="radio" name="userAction" id="pUserAction4" value="Cancel">Cancel action
                    <br><input type="submit" name="submit" id="pSubmit5" value="Confirm">
                </form>
            </div><br>
            <?php
                if (isset($_GET["userAction"])){
                    if ($_GET["userAction"] == "Delete User"):
                        try {
                            $deletePDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                            $deleteStatement1 = $deletePDO->prepare("Delete From Register Where CPR = :cpr");
                            $deleteStatement2 = $deletePDO->prepare("Delete From Login Where CPR = :cpr)";
                            $deleteStatement1->bindParam(':cpr', $_SESSION["cpr"]);
                            $deleteStatement2->bindParam(':cpr', $_SESSION["cpr"]);
                            $deleteStatement1->execute();
                            $deleteStatement2->execute();
                            if ($deleteStatement1->rowCount() > 0 && $deleteStatement2->rowCount > 0):
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
                                header("Location: login.php");
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
                    elseif ($_GET["userAction"] == "Edit User"):
            ?>
                        <div class="container">
                            <form action="main.php" method="post">
                                <label for="yourChoice">Select one or more of these field to be edited: </label>
                                <br><label for="editname">Enter your name: </label>
                                <input type="text" name="editname" id="pEditName" placeholder="Full name preferable">
                                <br><label for="edittelNum">Enter your telephone number: </label>
                                <input type="tel" name="edittelNum" id="pEditTelNum" value="+97337763522">
                                <br><label for="editemail">Enter your email: </label>
                                <input type="email" name="editemail" id="pEditEmail" value="someone@example.com">
                                <br><label for="editpassword">Enter your password: </label>
                                <input type="password" name="editpassword" id="pEditPassword" placeholder="Up to 20 characters">
                                <br><input type="submit" name="editsubmission" id="pSubmit6" value="Confirm">
                            </form>
                        </div><br>
                        <header>Take note that you cannot change your idetification number and your birthdate</header><br>
            <?php
                        try {
                            $editPDO = "empty";
                            if (isset($_POST["editsubmission"])){
                                if (isset($_POST["editname"])):
                                    $editPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                    $editName = $editPDO->prepare("Update Register Set Name = ? Where CPR = ?");
                                    $editName->execute([$_POST["editname"], $_SESSION["cpr"]]);
                                    if ($editName->rowCount() > 0):
            ?>
                                        <script>
                                            alert("The name in your account have been successfully edited!");
                                            console.warn("Name field have been changed in Register entity.");
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
                                if (isset($_POST["edittelNum"])):
                                    $editPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha"); 
                                    $editNum = $editPDO->prepare("Update Register Set TelNum = ? Where CPR = ?");
                                    $editNum->execute([$_POST["edittelNum"], $_SESSION["cpr"]]);
                                    if ($editNum->rowCount() > 0):
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
                                endif;
                                if (isset($_POST["editemail"])):
                                    $editPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                    $editEmail1 = $editPDO->prepare("Update Register Set Email = ? Where CPR = ?");
                                    $editEmail2 = $editPDO->prepare("Update Login Set Email = ? Where CPR = ?");
                                    $editEmail1->execute([$_POST["editemail"], $_SESSION["cpr"]]);
                                    $editEmail2->execute([$_POST["editemail"], $_SESSION["cpr"]]);
                                    if ($editEmail1->rowCount() > 0 && $editEmail2->rowCount() > 0):
            ?>
                                        <script>
                                            alert("The email in your account have been successfully edited!");
                                            console.warn("Email field have been changed in both Register and Login entites.");
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
                                    $editPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                                    $editPassword1 = $editPDO->prepare("Update Register Set Password = ? Where CPR = ?");
                                    $editPassword2 = $editPDO->prepare("Update Login Set Password = ? Where CPR = ?");
                                    $editPassword1->execute([$_POST["editpassword"], $_SESSION["cpr"]]);
                                    $editPassword2->execute([$_POST["editpassword"], $_SESSION["cpr"]]);
                                    if ($editPassword1->rowCount() > 0 && $editPassword2->rowCount() > 0):
            ?>
                                        <script>
                                            alert("The password in your account have been successfully edited!");
                                            console.warn("Password field have been changed in both Register and Login entites.");
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
                                endif;
            ?>
                                <script>
                                    alert("A change have been occured in your account");
                                    console.warn("There might be a change in the data in the registered and login entites.");
                                </script>
            <?php
                                header("Location: main.php");
                                exit();
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
                            echo "Result: ".$e->getMessage()."<br>
                        }
                    elseif($_GET["userAction"] == "Logout"):
                        $_SESSION = array();
                        session_destroy();
            ?>
                        <script>
                            alert("You have been logged out of the page.");
                            console.warn("The session have been destroyed.");
                            console.time();
                            alert("Heading back to login page!");
                            console.log("The current screen displayed is going to point to login page");
                        </script>
            <?php
                        header("Location: login.php");
                        exit();
                    endif;
                }
            ?>
        </body>
    `;
});