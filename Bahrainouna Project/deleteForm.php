<head>
    <meta charset="utf-8">
    <meta content="width=device-width; initial-scale=1.0">
    <title>Creating Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
</head>
<img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="align-self: center; align-items: center;"><br>
<body id="formBody551">
    <h3 align="center">Choose an option below to start action in this website:</h3><br>
    <nav class="container">
        <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
        <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account-->
        <button id="questions">Quiz</button> <!--Answer Form-->
        <button id="logout">Logout</button> <!--Logout-->
    </nav><br>
    <script src="main1.js">console.log("The rest of the code started from the javascript file.");</script>
</body>
<form action="deleteForm.php" method="get">
    <div class="container">
        <label for="selectForm">Select the form to delete: </label>
        <?php 
            try {
                $selectionMade = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                $ownerPDO = $selectingMade->query("Select ID, Name From Form"); 
                foreach($ownerPDO as $own):
        ?>
                    <input type="radio" name="selectForm" id="pOwnering<?= $own["ID"];?>" value="<?=$own["ID"];?>">
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
        $deletePDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
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
                header("main1.php");
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
?>