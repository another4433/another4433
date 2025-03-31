<?php
    require("dataStructure.php");
    require("answerClass.php");

    class Question {
        protected int $ID = 0;
        protected string $question = "empty";
        protected PhpArrayList $Answers;
        protected Answer $answerReference;

        public function __construct($question){
            $this->ID = 1;
            $this->question = $question;
            $this->Answers = new PhpArrayList("answer");
        }

        public function setID($newID){
            $this->ID = $newID;
        }
        public function getID(){
            return $this->ID;
        }
        public function setQuestion($newQuestion){
            $this->question = $newQuestion;
        }
        public function getQuestion(){
            return $this->question;
        }
        public function addAnswer($answerKey, $answerDetail){
            $this->answerReference = new Answer($answerKey, $answerDetail);
            return $this->Answers->add("answer", $this->answerReference);
        }
        public function deleteAnswer($answerKey, $answerDetail){
            $this->answerReference = new Answer($answerKey, $answerDetail);
            return $this->Answers->removeItem("answer", $this->answerReference);
        }
        public function replaceAnswer($oldAnswerKey, $oldAnswerDetail, $newAnswerKey, $newAnswerDetail){
            return $this->Answers->replace("answer", new Answer($oldAnswerKey, $oldAnswerDetail), new Answer($newAnswerKey, $newAnswerDetail));
        }
        public function searchAnswer($answerKey, $answerDetail){
            $this->answerReference = new Answer($answerKey, $answerDetail);
            return $this->Answers->search("answer", $this->answerReference);
        }
        public function indexOfAnswer($answerKey, $answerDetail){
            $this->answerReference = new Answer($answerKey, $answerDetail);
            return $this->Answers->indexOf("answer", $this->answerReference);
        }
        public function getAnswer($indexSelection){
            return $this->Answers->get("answer", $indexSelection);
        }
        public function isAnswersEmpty(){
            return $this->Answers->isEmpty();
        }
        public function size(){
            return ($this->Answers->getCounter() === $this->Answers->columnSize("answer")) ? $this->Answers->getCounter() : $this->Answers->columnSize("answer");
        }
        public function display(){
            echo "<br>Question: ".$this->getQuestion()."<br>";
            echo "Answers:<br>";
            echo $this->Answers->display("answer");
        }
    }
?>