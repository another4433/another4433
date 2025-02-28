<head>
    <meta charset="utf-8">
    <meta content="width=device-width; initial-scale=1.0">
    <title>Creating Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
</head>
<img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="align-self: center; align-items: center;"><br>
<body id="formBody553">
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
    try {
        $viewPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
        if (isset($_SESSION["cpr"])){
            $view = $viewPDO->prepare("Select * From Register Where CPR = :cpr");
            $view->bindParam(":cpr", $_SESSION["cpr"]);
            $view->execute();
            $user = $view->fetch();
            if (isset($user)){
?>
                <script>
                    alert("Successfully retrieved profile information!");
                    console.log("User data have been retrieved from the register entity.");
                    console.time();
                </script>
                <table class="pico">
                    <tr>
                        <th>Name</th>
                        <td><?= $user["Name"];?></td>
                    </tr>
                    <tr>
                        <th>CPR</th>
                        <td><?= $user["CPR"];?></td>
                    </tr>
                    <tr>
                        <th>Date of Birth</th>
                        <td><?= $user["DOB"];?></td>
                    </tr>
                    <tr>
                        <th>Age</th>
                        <td><?= $user["Age"];?></td>
                    </tr>
                    <tr>
                        <th>Last User Created On</th>
                        <td><?= $user["History"];?></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><?= $user["Email"];?></td>
                    </tr>
                    <tr>
                        <th>TelNum</th>
                        <td><?= $user["TelNum"];?></td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td><?= $user["Password"];?></td>
                    </tr>
                </table>
<?php
            }
            else {
?>
                <script> 
                    alert("Failed to get profile information.");
                    console.error("There's a bug when getting information about the user.");
                    console.info("I bet that there's a problem from data retrieval from the database.");
                </script>
<?php
            }
        }
        else {
?>
            <div class="pico">
                <form action="viewUser.php" method="get">
                    <br><label for="viewProfile">Enter your CPR: </label>
                    <input type="text" name="viewProfile" id="vProfile1" placeholder="Must be 9 digits">
                    <br><input type="submit" name="theSubmission" id="pSubmit77" value="Confirm">
                </form>
            </div><br>
<?php
            if (isset($_GET["viewProfile"]) && isset($_GET["theSubmission"])){
                $view = $viewPDO->prepare("Select * From Register Where CPR = :cpr");
                $view->bindParam(":cpr", $_SESSION["cpr"]);
                $view->execute();
                $user = $view->fetch();
                if (isset($user)){
?>
                    <script>
                        alert("Successfully retrieved profile information!");
                        console.log("User data have been retrieved from the register entity.");
                        console.time();
                    </script>
                    <table class="pico">
                        <tr>
                            <th>Name</th>
                            <td><?= $user["Name"];?></td>
                        </tr>
                        <tr>
                            <th>CPR</th>
                            <td><?= $user["CPR"];?></td>
                        </tr>
                        <tr>
                            <th>Date of Birth</th>
                            <td><?= $user["DOB"];?></td>
                        </tr>
                        <tr>
                            <th>Age</th>
                            <td><?= $user["Age"];?></td>
                        </tr>
                        <tr>
                            <th>Last User Created On</th>
                            <td><?= $user["History"];?></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><?= $user["Email"];?></td>
                        </tr>
                        <tr>
                            <th>TelNum</th>
                            <td><?= $user["TelNum"];?></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><?= $user["Password"];?></td>
                        </tr>
                    </table>
<?php
                }
                else {
?>
                    <script> 
                        alert("Failed to get profile information.");
                        console.error("There's a bug when getting information about the user.");
                        console.info("I bet that there's a problem from data retrieval from the database.");
                    </script>
<?php
                }
            }
        }
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
    //It should display user information vertically
?>