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
        public function __construct($identifier, $question, $answer, $OwnerForm){
            $this->answer = $answer;
            $this->question = $question;
            $this->identifier = $identifier;
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
?>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0">
        <title>Bahrainouna Q&A</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    </head>
    <body>
        <h3>Choose an option below to start action in this website:</h3><br>
        <nav class="container">
            <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Answer Form-->
            <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, Logout-->
            <button id="questions">Show questions</button>&nbsp;&nbsp;
            <button id="answers">Show answers</button>
        </nav><br>
    </body>
    <script src="main.js">console.log("The rest of the code started from the javascript file.");</script>
</html>