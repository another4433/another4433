<?php
    require("personClass.php");
    require("registerClass.php");
    include("answerClass.php");
    include("questionClass.php");
    include("formClass.php");
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Register for Bahrainouna Q&A</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2/dist/sweetalert2.js'
            import 'sweetalert2/src/sweetalert2.scss'
        </script>
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body>
        <h1 class="pico" align="center">Welcome to Bahrainouna Q&A Registration page</h1><br>
        <div id="theForm" class="container">
            <form action="register2.php" method="post">
                <label for="name">Enter your name: </label>
                <input type="text" name="name" id="pName" placeholder="Full name preferable"><br>
                <label for="cpr">Enter your CPR: </label>
                <input type="text" name="cpr" id="pCpr" placeholder="9 digit placement"><br>
                <label for="telNum">Enter your telephone number: </label>
                <input type="tel" name="telNum" id="pTelNum" value="+97337763522"><br>
                <label for="email">Enter your email: </label>
                <input type="email" name="email" id="pEmail" value="someone@example.com"><br>
                <label for="password">Enter your password: </label>
                <input type="password" name="password" id="pPassword" placeholder="Up to 20 characters"><br>
                <label for="day">Enter day number: </label>
                <input type="number" name="day" id="pDay" min="1" max="31" step="1"><br>
                <label for="month">Enter month number: </label>
                <input type="number" name="month" id="pMonth" min="1" max="12" step="1"><br>
                <label for="year">Enter year number: </label>
                <input type="number" name="year" id="pYear" max="2500" min="2000" step="1"><br>
                <input type="submit" name="submission" id="pSubmit" value="Confirm">
            </form>
        </div>
        <?php
            try {
                $pdo = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                if (isset($_POST["name"]) && isset($_POST["cpr"]) && isset($_POST["email"]) && isset($_POST["telNum"]) && isset($_POST["submission"])){
                    $account = new PhpRegister($_POST["name"], $_POST["cpr"], $_POST["telNum"], $_POST["day"], $_POST["month"], $_POST["year"], $_POST["email"], $_POST["password"]);
                    $_SESSION[$account->getCPR()] = $account->getPassword();
                    $hashed_password = password_hash($account->getPassword(), PASSWORD_BCRYPT);
                    $statement = $pdo->prepare("Insert Into Register Values (?, ?, ?, ?, ?, ?, ?, ?)");
                    $statement->execute([$account->getName(), $account->getCPR(), $account->getDOB()->format('Y-m-d'), $account->getAge(), $account->getHistory(), $account->getEmail(), $account->getTelNum(), $hashed_password]);
                    if ($statement->rowCount() > 0){
        ?>
        <script>
            Swal.fire({
                title: 'Success!',
                text: 'An account have been created.',
                icon: 'success',
                confirmButtonText: 'Cool',
                draggable: true
            });
            console.warn("Data have been inserted in Register entity.");
            console.time();
        </script>
        <?php
                        header("Location: login2.php");
                    }
                    else {
        ?>
        <script>
            alert("Failed to create an account!");
            console.error("There's a bug preventing data to be inserted into Register entity. Check it and fix it!");
        </script>
        <?php
                    }
                    echo "Data after insertion: ".$result."<br>";
                }
            }
            catch(PDOException $e){
        ?>
        <script>
            Swal.fire({
                title: 'Data Error!',
                text: 'There is an error in the database',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            console.error("There's a bug in the code. Check it!");
        </script>
        <?php
                echo "Result: ".$e->getMessage()."<br>";
            }
            catch(Exception $exception){
        ?>
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'There is a problem in the application.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            console.error("There's a bug in the code. Check it!");
        </script>
        <?php
                echo "Result: ".$exception->getMessage()."<br>";
            }
        ?>
    </body>
    <a href="login2.php">Back to login?</a><br>
</html>