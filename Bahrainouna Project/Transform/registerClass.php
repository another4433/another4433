<?php
    require("personClass.php");
    class PhpRegister extends PhpPerson {
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
        public function setEmail($newEmail){
            $this->Email = $newEmail;
        }
        public function setPassword($newPassword){
            $this->Password = $newPassword;
        }
        public function display(){
            echo "<br>Name: ".$this->getName();
            echo "<br>CPR: ".$this->getCPR();
            echo "<br>Telephone Number: ".$this->getTelNum();
            echo "<br>Date of Birth: ".$this->getDOB();
            echo "<br>Age: ".$this->getAge();
            echo "<br>History: ".$this->getHistory();
            echo "<br>Email: ".$this->getEmail();
            echo "<br>Password: ".$this->getPassword()."<br>";
        }
    }
?>