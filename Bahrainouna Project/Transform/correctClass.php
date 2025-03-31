<?php
    class Correct {
        protected int $qNum;
        protected string $answer;

        public function __construct($qNum, $answer){
            $this->answer = $answer;
            $this->qNum = $qNum;
        }

        public function setNum($qNum){
            $this->qNum = $qNum;
        }
        public function getNum(){
            return $this->qNum;
        }
        public function setQCorrect($answer){
            $this->answer = $answer;
        }
        public function getQCorrect(){
            return $this->answer;
        }
        public function display(){
            echo "<br>Question number: ".$this->getNum();
            echo "<br>Answer key: ".$this->getQCorrect();
        }
    }
?>