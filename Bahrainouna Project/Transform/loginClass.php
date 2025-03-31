<?php
    class PhpLogin {
        protected string $Email = "empty", $Password = "empty", $CPR = "empty";
        protected DateTime $History;

        public function __construct($newEmail, $newPassword, $newCPR){
            $this->Email = $newEmail;
            $this->Password = $newPassword;
            $this->CPR = $newCPR;
            $this->History = new DateTime();
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
            return $this->History->format("D-m-y H:i:s");
        }

        public function setEmail($newEmail){
            $this->Email = $newEmail;
        }
        public function setPassword($newPassword){
            $this->Password = $newPassword;
        }

        public function display(){
            echo "<br>CPR: ".$this->getCPR();
            echo "<br>Email: ".$this->getEmail();
            echo "<br>Password: ".$this->getPassword();
            echo "<br>History: ".$this->getHistory()."<br>";
        }
    }
?>