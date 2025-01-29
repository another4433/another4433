<?php
    class Login {
        public string $Email = "empty", $Password = "empty", $CPR = "empty";
        public DateTime $History;
        public function __construct($Email, $Password, $CPR){
            $this->Email = $Email;
            $this->CPR = $CPR;
            $this->Password = $Password;
            $this->History = new DateTime("now");
        }
        public function getEmail(){
            return $this->Email;
        }
        public function getPassword(){
            return $this->Password;
        }
        public function getCPR(){
            return $this->CPR;
        }
        public function getHistory(){
            return $this->History;
        }
    }
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Login to Bahrainouna Q&A!</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    </head>
    <img src="Bahrain-Flag.jpg" alt="Bahrainouna Q&A"><br>
    <body>
        <h1 class="pico">Welcome to Bahrainouna Q&A login page</h1><br>
        <div id="theForm" class="container">
            <form action="login.php" method="post">
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
                $myPDO = new PDO("mysql:host=localhost;port=22;dbname=theChallenge", "root", "MOH123ha");
                if (isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["submission"])){
                    $_SESSION["email"] = $_POST["email"];
                    $_SESSION["cpr"] = $_POST["cpr"];
                    $_SESSION["password"] = $_POST["password"];
                    $stmt = $myPDO->prepare("Select Email, Password From Register Where CPR = :cpr");
                    $stmt->bindParam(':cpr', $_SESSION["cpr"]);
                    $stmt->execute();
                    $result = $stmt->fetch();
                    if ($_SESSION["email"] == $result['email'] && $_SESSION["password"] == $result['password']){
        ?>
        <script>console.log("Data have been retrieved correctly from Register entity for Login entity.");</script>
        <?php
                        $statement = $myPDO->prepare("Insert Into Login Values (?, ?, ?, ?)");
                        $myLogin = new Login($_SESSION["email"], $_SESSION["password"], $_SESSION["cpr"]);
                        $statement->execute([$myLogin->getEmail(), $myLogin->getPassword(), $myLogin->getHistory()->format('Y-m-d H:i:s'), $myLogin->getCPR()]);
                        if ($statement->rowCount() > 0){
        ?>
        <script>
            alert("Successfully logged in!");
            console.warn("Data have been inserted into Login entity successfully!");
            console.time();
        </script>
        <?php
                            header("Location: main.php");
                        }
                        else {
        ?>
        <script>
            alert("Failed to login!");
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
            alert("Failed to connect to the database.");
            console.error("There's a problem with pdo initialization.");
            console.info("Re-check the object instantiation of pdo!");
        </script>
        <?php
                echo "Result: ".$e->getMessage()."<br>";
            }
            catch(Exception $exception){
        ?>
        <script>
            alert("There's an error in the application.");
            console.error("There's a bug in the code. Check it!");
        </script>
        <?php
                echo "Result: ".$exception->getMessage()."<br>";
            }
        ?>
        <a href="register.php">Register account?</a><br>
        <a href="#">Forget password?</a>
        <a href="mailto:alimohamedhassan9@outlook.com">Need help? Contact Admin.</a>
    </body>
</html>