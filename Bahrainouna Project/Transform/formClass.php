<?php
    require("dataStructure.php");
    require("answerClass.php");
    require("questionClass.php");
    require("registerClass.php");
    require("correctClass.php");

    class Form {
        protected int $formID = 0, $questionCount = 0, $answerCount = 0, $correctCount = 0;
        protected string $formName = "empty";
        protected DateTime $dateTime;
        protected PhpArrayList $phpArrayList; //List of questions and answers, corrections, answer keys, answers, and questions
        protected Answer $answerReference;
        protected Question $questionReference;
        protected PhpRegister $owner;
        protected Correct $correct;

        public function __construct($name, $owner){
            $this->formID = 1;
            $this->formName = $name;
            $this->dateTime = new DateTime("now");
            $this->phpArrayList = new PhpArrayList("questionAnswer");
            $this->owner = $owner;
        }
        public function setFormID($ID){
            $this->formID = $ID;
        }
        public function getFormID(){
            return $this->formID;
        }
        public function setFormName($name){
            $this->formName = $name;
        }
        public function getFormName(){
            return $this->formName;
        }
        public function getDateTime(){
            return $this->dateTime->format("D-m-y H:i:s");
        }
        public function getQuestionSize(){
            return $this->questionCount;
        }
        public function getSizeCorrections(){
            return $this->correctCount;
        }
        public function addQuestion($item){
            $this->questionReference = new Question($item);
            $this->questionCount = $this->getQuestionSize() + 1;
            if ($this->getQuestionSize() > 1){
                $this->questionReference->setID($this->getQuestionSize());
            }
            return $this->phpArrayList->add("questionAnswer", $item);
        }
        public function deleteQuestion($item){
            $this->questionReference = new Question($item);
            return $this->phpArrayList->removeItem("questionAnswer", $this->questionReference);
        }
        public function changeQuestion($oldQuestion, $newQuestion){
            return $this->phpArrayList->set("questionAnswer", $this->phpArrayList->indexOf("questionAnswer", new Question($oldQuestion)), new Question($newQuestion));
        }
        public function totalAnswerCount(){
            return $this->answerCount;
        }
        public function searchQuestion($question){
            return $this->phpArrayList->indexOf("questionAnswer", $question);
        }
        public function getQuestion($index){
            return $this->phpArrayList->get("questionAnswer", $index);
        }
        public function setOwner($owner){
            $this->owner = $owner;
        }
        public function getOwner(){
            return $this->owner;
        }
        public function addAnswerInQuestion($question, $key, $detail){
            if (isset($question)){
                $this->questionReference = new Question($question);
                $this->answerReference = new Answer($key, $detail);
                for ($i = 0; $i < $this->getQuestionSize(); $i++){
                    if ($this->getQuestion($i) === $this->questionReference){
                        $changed = $this->questionReference->addAnswer($this->answerReference->getKey(), $this->answerReference->getDetail());
                        if ($this->changeQuestion($this->questionReference, $changed) != null){
                            $this->answerCount = $this->totalAnswerCount() + 1;
                            return "<br>An answer have been successfully added to ".$this->getQuestion($i)."<br>";
                        }
                        else {
                            return "<br>Failed to add an answer to ".$this->getQuestion($i)."<br>";
                        }
                    }
                }
                return false;
            }
            return null;
        }
        public function removeAnswerInQuestion($question, $key, $detail){
            if (isset($question)){
                if ($this->totalAnswerCount() === 0 || $this->getQuestionSize() === 0){
                    return false;
                }
                $this->questionReference = new Question($question);
                $this->answerReference = new Answer($key, $detail);
                if ($this->questionReference->isAnswersEmpty()){
                    return false;
                }
                else {
                    $theReference = $this->questionReference->deleteAnswer($this->answerReference->getKey(), $this->answerReference->getDetail());
                    if (isset($theReference) || $theReference){
                        $this->answerCount = $this->totalAnswerCount() - 1;
                    }
                    return $theReference;
                }
            }
            return null;
        }
        public function searchAnswerInQuestion($question, $key, $detail){
            if (isset($question)){
                $this->questionReference = new Question($question);
                $this->answerReference = new Answer($key, $detail);
                $this->questionReference->addAnswer($this->answerReference->getKey(), $this->answerReference->getDetail());
                $searcher = $this->searchQuestion($this->questionReference);
                if ($searcher != -1){
                    $this->questionReference = $this->phpArrayList->get("questionAnswer", $searcher);
                    return $this->questionReference->indexOfAnswer($this->answerReference->getKey(), $this->answerReference->getDetail());
                }
                else {
                    return -1;
                }
            }
            return false;
        }
        public function getAnswerInQuestion($question, $index){
            if (isset($question)){
                $this->questionReference = new Question($question);
                $mySearchQuestion = $this->searchQuestion($question);
                if ($this->phpArrayList->get("questionAnswer", $mySearchQuestion) == $this->questionReference){
                    $this->questionReference = $this->phpArrayList->get("questionAnswer", $mySearchQuestion);
                    return $this->questionReference->getAnswer($index);
                }
                return false;
            }
            return null;
        }
        public function changeAnswerInQuestion($question, $oldAnswer, $newAnswer){
            if (isset($question) && isset($oldAnswer) && isset($newAnswer)){
                $this->questionReference = new Question($question);
                $this->answerReference = new Answer($oldAnswer->getKey(), $oldAnswer->getDetail());
                $newReference = new Answer($newAnswer->getKey(), $newAnswer->getDetail());
                if ($this->searchQuestion($this->questionReference) && $this->searchAnswerInQuestion($this->questionReference, $this->answerReference->getKey(), $this->answerReference->getDetail()) != -1){
                    $change = $this->questionReference->replaceAnswer($this->answerReference->getKey(), $this->answerReference->getDetail(), $newReference->getKey(), $newReference->getDetail());
                    return $this->changeQuestion($this->questionReference, $change);
                }
                return false;
            }
            return null;
        }
        public function display(){
            echo "<br>Form ID: ".$this->getFormID();
            echo "<br>Form Name: ".$this->getFormName();
            echo "<br>Created by: ".$this->getOwner();
            echo "<br>Last created on: ".$this->getDateTime();
            echo "<br>Number of questions created: ".$this->getQuestionSize();
            echo "<br>Number of answers created: ".$this->totalAnswerCount();
            echo "<br>Number of correct answers stored: ".$this->getSizeCorrections();
            echo "<br>List of Questions and Answers: <br>";
            echo $this->phpArrayList->display("questionAnswer");
        }
        public function prepQuiz(){
            $counterQ = 0; $counterA = 0;
            for ($a = 0; $a < $this->getQuestionSize(); $a++){
                $this->questionReference = $this->phpArrayList->get("questionAnswer", $a);
                $this->phpArrayList["question"][$counterQ] = $this->questionReference->getQuestion();
                $counterQ++;
                for ($b = 0; $b < $this->questionReference->size(); $b++){
                    $this->phpArrayList["answer"][$counterA] = $this->questionReference->getAnswer($b);
                    $counterA++;
                }
            }
            return $counterA >= $this->totalAnswerCount()-1 && $counterQ >= $this->getQuestionSize()-1;
        }
        public function addCorrection($qNum, $answer){
            $this->correct = new Correct($qNum, $answer);
            $this->phpArrayList["correct"][$this->getSizeCorrections()] = $this->correct;
            $this->correctCount = $this->getSizeCorrections() + 1;
        }
        public function deleteCorrection($qNum, $theAnswer){
            $this->correct = new Correct($qNum, $theAnswer);
            if ($this->phpArrayList->search("correct", $this->correct)){
                $backup = $this->correct;
                $operation = $this->phpArrayList->removeItem("correct", $this->correct);
                if ($operation != null && $operation != false){
                    $this->correctCount = $this->getSizeCorrections() - 1;
                    return $backup;
                }
                return $operation;
            }
            return false;
        }
        public function modifyCorrection($oldqNum, $oldAnswer, $newqNum, $newAnswer){
            $this->correct = new Correct($oldqNum, $oldAnswer);
            $correctReference = new Correct($newqNum, $newAnswer);
            return $this->phpArrayList->replace("correct", $this->correct, $correctReference);
        }
        public function getCorrect($index){
            return ($this->phpArrayList->isRange($index)) ? $this->phpArrayList->get("correct", $index) : false;
        }
        public function makeCorrections(){
            if ($this->prepQuiz() && $this->getSizeCorrections() >= $this->getQuestionSize()){
                $countGot = ""; $countTotal = $this->getSizeCorrections()-1;
                for ($c = 0; $c < $this->getSizeCorrections(); $c++){
                    $this->correct = $this->phpArrayList->get("correct", $c);
                    if ($this->phpArrayList->get("key", $c) === $this->correct->getQCorrect() && $this->correct->getNum() === $c){
                        $countGot++;
                    }
                }
                return "<br>Score: ".$countGot."/".$countTotal."<br>";
            }
            return "<br>Your answers could not be corrected.<br>";
        }
        public function startQuiz(){
            if ($this->getSizeCorrections() < $this->getQuestionSize() - 1){
                echo "You are not ready for the quiz";
                return false;
            }
            if ($this->prepQuiz()):
                for ($i = 0; $i < $this->getQuestionSize(); $i++):
                    $this->questionReference = $this->phpArrayList->get("question", $i);
                    echo "<br>".$i." ".$this->questionReference->getQuestion();
                    for ($j = 0; $j < $this->questionReference->size(); $j++):
                        $this->answerReference = $this->phpArrayList->get("answer", $j);
                        echo "<br>".$this->answerReference->getKey()." ".$this->answerReference->getDetail();
                    endfor;
                    echo "<br>";
?>
                    <form action="formClass.php" method="post">
                        <label for="answering">Answer: </label>
                        <input type="text" name="answering" value="O">
                        <input type="submit" name="submission" value="Submit">
                    </form><br>
<?php
                    if (isset($_POST["answering"]) && isset($_POST["submission"]) && $_POST["submission"] == "Submit"):
                        $this->phpArrayList["key"][$i] = $_POST["answering"];
                    endif;
                endfor;
                return true;
            endif;
            echo $this->makeCorrections();
            return false;
        }
        public function displayQuestions(){
            for ($i = 0; $i < $this->getQuestionSize(); $i++){
                echo "<br>".$this->phpArrayList->get("question", $i);
            }
        }
        public function displayAnswers(){
            for ($i = 0; $i < $this->totalAnswerCount(); $i++){
                echo "<br>".$this->phpArrayList->get("answer", $i);
            }
        }
    }
?>