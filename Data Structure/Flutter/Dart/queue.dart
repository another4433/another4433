class Queue<E> {
  List<E> queueArray = [];
  int size = 0, front = 0, rear = -1;

  Queue();

  int getFront(){
    return front;
  }
  int getRear(){
    return rear;
  }
  int getSize(){
    return size;
  }
  List<E> getQueueArray(){
    return queueArray;
  }
  void offer(E item){
    rear = getRear()+1;
    queueArray[getRear()] = item;
    size = getSize()+1;
  }
  E poll(){
    front = getFront()+1;
    return queueArray[getFront()-1];
  }
  E element(){
    return queueArray[getFront()];
  }
  void display(){
    print("Size = ${getSize()} \n");
    print("Queue: [");
    getQueueArray().forEach((action){
      print("$action, ");
    });
    print("]");
  }
}