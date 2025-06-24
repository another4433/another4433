class Stack<E> {
  int topOfStack = -1;
  List<E> stackArray = [];

  Stack();

  int getTopOfStack(){
    return topOfStack;
  }
  List<E> getStackArray(){
    return stackArray;
  }
  void push(E item){
    topOfStack = getTopOfStack()+1;
    stackArray[topOfStack] = item;
  }
  E pop(){
    E backup = stackArray[topOfStack];
    getStackArray().removeAt(topOfStack);
    topOfStack = getTopOfStack()-1;
    return backup;
  }
  E peek(){
    return stackArray[getTopOfStack()];
  }
  void display(){
    print("Size ${getTopOfStack()+1} \n");
    print("Stack: [");
    getStackArray().forEach((action){
      print("$action, ");
    });
    print("]");
  }
}