<?php
    require("personClass.php");
    require("registerClass.php");
    require("loginClass.php");
    include("answerClass.php");
    include("questionClass.php");
    include("formClass.php");
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Login to Bahrainouna Q&A!</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js">
            import Swal from 'sweetalert2/dist/sweetalert2.js'
            import 'sweetalert2/src/sweetalert2.scss'
        </script>
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body>
        <h1 class="pico" align="center">Welcome to Bahrainouna Q&A login page</h1><br>
        <div id="theForm" class="container">
            <form action="login2.php" method="post">
                <label for="cpr">Enter your CPR: </label>
                <input type="text" name="cpr" id="pCpr" placeholder="9 digit CPR"><br>
                <label for="email">Enter your email: </label>
                <input type="email" name="email" id="pEmail" value="someone@example.com"><br>
                <label for="password">Enter your password: </label>
                <input type="password" name="password" id="myPassword" placeholder="Up to 20 characters"><br>
                <input type="submit" name="submission" id="pSubmit" value="Confirm">
            </form><br>
        </div>
        <?php
            session_start();
            try {
                $myPDO = new PDO("mysql:host=localhost;port=3306;dbname=theChallenge", "root", "MOH123ha");
                if (isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["submission"])){
                    $myLog = new PhpLogin($_POST["email"], $_POST["password"], $_POST["cpr"]);
                    $_SESSION["email"] = $myLog->getEmail();
                    $_SESSION["cpr"] = $myLog->getCPR();
                    $_SESSION["password"] = password_hash($myLog->getPassword(), PASSWORD_BCRYPT);
                    $stmt = $myPDO->prepare("Select Email, Password From Register Where CPR = :cpr");
                    $stmt->bindParam(':cpr', $_SESSION["cpr"]);
                    $stmt->execute();
                    $result = $stmt->fetch();
                    if ($_SESSION["email"] == $result['Email'] && password_verify($myLog->getPassword(), $_SESSION["password"])){
        ?>
        <script>console.log("Data have been retrieved correctly from Register entity for Login entity.");</script>
        <?php
                        $statement = $myPDO->prepare("Insert Into Login Values (?, ?, ?, ?)");
                        $myLogin = new PhpLogin($_SESSION["email"], $_SESSION["password"], $_SESSION["cpr"]);
                        $statement->execute([$myLogin->getEmail(), $myLogin->getPassword(), $myLogin->getHistory(), $myLogin->getCPR()]);
                        if ($statement->rowCount() > 0){
        ?>
        <script>
            Swal.fire({
                title: 'Success!',
                text: 'You have logged in to the website.',
                icon: 'success',
                confirmButtonText: 'Cool',
                draggable: true
            });
            console.warn("Data have been inserted into Login entity successfully!");
            console.time();
        </script>
        <?php
                            header("Location: main2.php");
                        }
                        else {
        ?>
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'Failed to login.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            console.error("Failed to insert data into Login entity.");
            console.info("There's a bug preventing data to be inserted into Login entity.");
        </script>
        <?php
                        }
                    }
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
            console.error("There's a problem with pdo initialization.");
            console.info("Re-check the object instantiation of pdo!");
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
        <a href="register2.php">Register account?</a><br>
        <a href="mailto:alimohamedhassan9@outlook.com">Forgot Password? Contact Admin.</a>
    </body>
</html>