<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width; initial-scale=1.0">
        <title>Displaying Questions</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <div class="container" id="formDIV55">
        <h3 align="center">Choose an option below to start action in this website:</h3><br>
        <nav class="container">
            <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
            <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account-->
            <button id="questions">Quiz</button> <!--Answer Form-->
            <button id="logout">Logout</button> <!--Logout-->
        </nav><br>
        <script src="main1.js">console.log("The rest of the code started from the javascript file.");</script>
    </div><br>
    <body>
        <table class="pico">
            <tr>
                <th>Question</th>
                <th>Form ID referred to</th>
            </tr>
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
                    $displayPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                    $displayResults = $displayPDO->query("Select * From Questions");
                    foreach ($displayResults as $row):
            ?>
                        <tr>
                            <td><?= $row['theSpecific']; ?></td>
                            <td><?= $row['OwnerForm']; ?></td>
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
</html>