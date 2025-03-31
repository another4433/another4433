<?php
    class PhpArrayList {
        protected int $rowSize, $counter;
        protected mixed $theArray, $columnSize;
        protected string $key = "empty";

        public function __construct($specifyKey){
            $this->rowSize = 0;
            $this->columnSize = array();
            $this->theArray = array();
            $this->key = $specifyKey;
            $this->counter = 0;
        }

        public function rowSize(){
            return $this->rowSize;
        }
        public function isEmpty(){
            return $this->rowSize() === 0 && $this->columnSize($this->currentKey()) == 0;
        }
        public function isColumnEmpty(){
            return $this->columnSize($this->currentKey()) == 0;
        }
        public function isRange($index){
            return $index >= 0 && $index <= $this->rowSize() && $index <= $this->columnSize($this->currentKey()); 
        }
        public function columnSize($key){
            return $this->columnSize[$key];
        }
        public function currentKey(){
            return $this->key;
        }
        public function setKey($key){
            $this->key = $key;
        }
        public function getCounter(){
            return $this->counter;
        }
        public function indexOf($key, $item){
            $checker = false;
            for ($i = 0; $i < $this->rowSize(); $i++){
                if ($this->theArray[$key] != null && $this->columnSize($key) != null){
                    $checker = true;
                    break;
                }
            }
            if ($checker){
                for ($j = 0; $j < $this->columnSize($key); $j++){
                    if ($this->theArray[$key] == $item){
                        return $j;
                    }
                }
            }
            return -1;
        }
        public function get($key, $index){
            $checker = false;
            for ($i = 0; $i < $this->rowSize(); $i++){
                if ($this->theArray[$key] != null && $this->columnSize($key) != null){
                    if ($this->isRange($index)){
                        $checker = true;
                        break;
                    }
                }
            }
            if ($checker){
                for ($j = 0; $j < $this->columnSize($key); $j++){
                    if ($j === $index){
                        return $this->theArray[$key][$j];
                    }
                }
            }
            return null;
        }
        public function add($key, $item){
            $this->setKey($key);
            $this->rowSize = ($this->isEmpty()) ? 0 : $this->rowSize() + 1;
            $this->theArray[$this->currentKey()][$this->getCounter()] = $item;
            $this->counter = ($this->isColumnEmpty()) ? 0 : $this->getCounter() + 1;
            $this->columnSize[$this->currentKey()] = $this->getCounter();
            return "<br>The item ".$this->get($this->currentKey(), $this->indexOf($this->currentKey(), $this->theArray[$this->currentKey()])). "have been inserted in an array with the key ".$this->currentKey()."<br>";
        }
        public function search($key, $item){
            return $this->indexOf($key, $item) > -1;
        }
        public function removeItem($key, $item){
            if ($this->isEmpty()){
                return false;
            }
            elseif ($this->search($key, $item)){
                $this->setKey($key);
                $getItem = $this->theArray[$this->currentKey()][$this->indexOf($this->currentKey(), $item)];
                for ($i = $this->indexOf($this->currentKey(), $item); $i < $this->columnSize($this->currentKey())-1; $i++){
                    if ($this->theArray[$this->currentKey()][$i+1] == null && $i == $this->indexOf($this->currentKey(), $item)){
                        $this->theArray[$this->currentKey()][$i] = null;
                        break;
                    }
                    elseif ($this->theArray[$this->currentKey()][$i+1] == null && $i > $this->indexOf($this->currentKey(), $item)){
                        break;
                    }
                    else {
                        $this->theArray[$this->currentKey()][$i] = $this->theArray[$this->currentKey()][$i+1];
                    }
                }
                $this->columnSize[$this->currentKey()] = $this->columnSize[$this->currentKey()] - 1;
                return $getItem;
            }
            else {
                return null;
            }
        }
        public function deleteKey($key){
            if ($this->isEmpty()){
                return false;
            }
            elseif ($this->theArray[$key] != null && $this->columnSize($key) != null){
                $returner = $this->theArray[$key];
                $this->columnSize[$key] = null;
                $this->theArray[$key] = null;
                $this->rowSize = $this->rowSize - 1;
                return $returner;
            }
            else {
                return null;
            }
        }
        public function set($key, $oldIndex, $newItem){
            if ($this->search($key, $this->get($key, $oldIndex))){
                $backup = $this->get($key, $oldIndex);
                $this->theArray[$key][$oldIndex] = $newItem;
                return $backup;
            }
            else {
                return null;
            }
        }
        public function replace($key, $oldItem, $newItem){
            return $this->set($key, $this->indexOf($key, $oldItem), $newItem) != null;
        }
        public function display($key){
            $checker = false;
            for ($i = 0; $i < $this->rowSize(); $i++){
                if ($this->theArray[$key] != null && $this->columnSize($key) != null){
                    $checker = true;
                    break;
                }
            }
            if ($checker){
                for ($j = 0; $j < $this->columnSize($key); $j++){
                    echo "<br>".$this->theArray[$key][$j];
                }
                echo "<br>";
                return true;
            }
            return false;
        }
    }
?>