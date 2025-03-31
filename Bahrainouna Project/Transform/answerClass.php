<?php
    class Answer {
        protected string $key = "O", $detail = "empty";

        public function __construct($newKey, $newDetail){
            $this->key = $newKey;
            $this->detail = $newDetail;
        }
        public function getKey(){
            return $this->key;
        }
        public function getDetail(){
            return $this->detail;
        }
        public function setKey($newKey){
            $this->key = $newKey;
        }
        public function setDetail($newDetail){
            $this->detail = $newDetail;
        }
        public function display(){
            echo "<br>">$this->getKey().". ".$this->getDetail()."<br>";
        }
    }
?>