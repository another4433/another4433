<?php
    class PhpPerson {
        protected string $Name = "empty", $CPR = "empty", $TelNum = "empty";
        protected int $Age = 0;
        protected DateTime $DOB = new DateTime(), $History;

        public function __construct($Name, $CPR, $TelNum, $day, $month, $year){
            $this->Name = $Name;
            $this->CPR = $CPR;
            $this->TelNum = $TelNum;
            $this->DOB = new DateTime($year."-".$month."-".$day);
            $this->History = new DateTime("now");
            $this->Age = $this->calculateAge();
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
            return $this->History->format("Y-m-d H:i:s");
        }
        public function getAge(){
            return $this->Age;
        }
        public function setName($newName){
            $this->Name = $newName;
        }
        public function setTelNum($newNum){
            $this->TelNum = $newNum;
        }
        public function setCPR($newCPR){
            $this->CPR = $newCPR;
        }
        public function display(){
            echo "<br>Name: ".$this->getName();
            echo "<br>CPR: ".$this->getCPR();
            echo "<br>Telephone Number: ".$this->getTelNum();
            echo "<br>Date of Birth: ".$this->getDOB();
            echo "<br>Age: ".$this->getAge();
            echo "<br>History: ".$this->getHistory()."<br>";
        }
    }
?>