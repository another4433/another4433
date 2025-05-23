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
            return $this->History->format('Y-m-d H:i:s');
        }
    }
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
    class TheKeys {
        public int $OwnerForm = 0;
        public string $theLetter = 'O';
        public function __construct($theLetter, $OwnerForm){
            $this->OwnerForm = $OwnerForm;
            $this->theLetter = $theLetter;
        }
        public function getOwnerForm(){
            return $this->OwnerForm;
        }
        public function getTheLetter(){
            return $this->theLetter;
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
?>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Bahrainouna Q&A</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    </head>
    <img src="bahrain.jpg" alt="Bahrainouna Q&A" width="500px" height="150px" style="margin-left: 35%;"><br>
    <body id="formBody555">
        <h3 align="center">Choose an option below to start action in this website:</h3><br>
        <nav class="container">
            <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
            <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, View Account-->
            <button id="questions">Quiz</button> <!--Answer Form-->
            <button id="logout">Logout</button> <!--Logout-->
        </nav><br>
        <script src="main1.js">console.log("The rest of the code started from the javascript file.");</script>
        <h4 align="center">About Us</h4>
        <p class="container"><br>
            This website is used to allow user to post questions about bahrain tradition. <br>
            The users can test themeselves to determine their knowledge about Bahrain tradition. <br>
            The questions that will be posted by the users should fit the theme of Bahrain tradition. <br>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. <br>
            Dignissimos et expedita velit, eum, explicabo quasi at facere quam similique perferendis veniam? <br>
            Officiis, accusamus est nostrum fugiat aliquam vero. Culpa, eveniet? <br>
        </p><br>
    </body>
    <?php
        if (isset($_GET["forming"])){
            switch ($_GET["forming"]){
                case "Create Form": { header("Location: createForm.php"); break; }
                case "Delete Form": { header("Location: deleteForm.php"); break; }
                case "Edit Form": { header("Location: editForm.php"); break; }
                case "Show Form": {
    ?>
                    <br><div class="container">
                        <form action="main1.php" method="get">
                            <label for="forAsking">Select any of these form components: </label>
                            <br><input type="radio" name="forAsking" id="pForAsking1" value="Questions">Question
                            <br><input type="radio" name="forAsking" id="pForAsking2" value="Answers">Answer
                        </form>
                    </div><br>
    <?php
                    if (isset($_GET["forAsking"])){
                        switch($_GET["forAsking"]){
                            case "Questions":
                                header("Location: displayQuestions.php");
                                break;
                            case "Answers":
                                header("Location: displayAnswers.php");
                                break;
                        }
                    }
                    break;
                }
                default: header("Location: main1.php");
            } 
        }
        elseif (isset($_GET["userAction"])){
            switch($_GET["forming"]){
                case "Delete User": 
                    header("Location: deleteUser.php");
                    break;
                case "Edit User":
                    header("Location: editUser.php");
                    break;
                case "View User":
                    header("Location: viewUser.php");
                    break;
                default: header("Location: main1.php");
            }
        }
        elseif (isset($_GET["quitting"]) && $_GET["quitting"] == "Yes"){
            header("Location: loggedout.php");
            exit();
        }
        elseif (isset($_GET["quizzing"]) && $_GET["quizzing"] == "Yes"){
            header("Location: quiztime.php");
        }
    ?>
</html>