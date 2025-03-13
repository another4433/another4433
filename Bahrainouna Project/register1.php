<?php
class Person {
    public string $Name = "empty", $CPR = "empty", $TelNum = "empty";
    public int $age = 0;
    public DateTime $DOB, $History;
    public function __construct($Name, $CPR, $TelNum, $day, $month, $year){
        $this->Name = $Name;
        $this->CPR = $CPR;
        $this->TelNum = $TelNum;
        $this->DOB = new DateTime($year."-".$month."-".$day);
        $this->History = new DateTime("now");
        $this->age = $this->calculateAge();
    }
    protected function calculateAge(){
        $present = new DateTime();
        $presentString = $present->format('Y-m-d');
        $presentDay = $this->subString($presentString, 8, 10);
        $presentMonth = $this->subString($presentString, 5, 7);
        $presentYear = $this->subString($presentString, 0, 4);
        $birthString = $this->DOB->format('Y-m-d');
        $birthDay = $this->subString($birthString, 8, 10);
        $birthMonth = $this->subString($birthString, 5, 7);
        $birthYear = $this->subString($birthString, 0, 4);
        $result = ($birthDay < $presentDay || $birthMonth < $presentMonth) ? ($presentYear - $birthYear) - 1 : $presentYear - $birthYear;
        if ($presentYear < $birthYear)
            return 0;
        else
            return $result;
    }
    private function subString($theString, $start, $end){
        if ($end == $start || $end <= 0)
            return null;
        else if ($end < $start){
            $temp = $start;
            $start = $end;
            $end = $temp;
        }
        $result = "";
        for ($i = $start; $i < $end; $i++){
            $result = $result.$theString[$i];
        }
        if ($result == "")
            return null;
        else 
            return $result;
    }
    public function getName(){
        return $this->Name;
    }
    public function getCPR(){
        return $this->CPR;
    }
    public function getTelNum(){
        return $this->TelNum;
    }
    public function getDOB(){
        return $this->DOB;
    }
    public function getHistory(){
        return $this->History;
    }
    public function getAge(){
        return $this->age;
    }
}
class Register extends Person {
    public string $Email = "empty", $Password = "empty";
    public function __construct($Name, $CPR, $TelNum, $day, $month, $year, $Email, $Password){
        parent::__construct($Name, $CPR, $TelNum, $day, $month, $year);
        $this->Email = $Email;
        $this->Password = $Password;
    }
    public function getEmail(){
        return $this->Email;
    }
    public function getPassword(){
        return $this->Password;
    }
}
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Register for Bahrainouna Q&A</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body>
        <h1 class="pico" align="center">Welcome to Bahrainouna Q&A Registration page</h1><br>
        <div id="theForm" class="container">
            <form action="register1.php" method="post">
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
                    $account = new Register($_POST["name"], $_POST["cpr"], $_POST["telNum"], $_POST["day"], $_POST["month"], $_POST["year"], $_POST["email"], $_POST["password"]);
                    $statement = $pdo->prepare("Insert Into Register Values (?, ?, ?, ?, ?, ?, ?, ?)");
                    $statement->execute([$account->getName(), $account->getCPR(), $account->getDOB()->format('Y-m-d'), $account->getAge(), $account->getHistory()->format('Y-m-d H:i:s'), $account->getEmail(), $account->getTelNum(), $account->getPassword()]);
                    if ($statement->rowCount() > 0){
        ?>
        <script>
            alert("Successfully created account!");
            console.warn("Data have been inserted in Register entity.");
            console.time();
        </script>
        <?php
                        header("Location: login1.php");
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
            alert("There's an error in the database.");
            console.error("There's a bug in the code. Check it!");
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
    </body>
</html>