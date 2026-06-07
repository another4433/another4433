class TheStack<E> {
  final List<E> _theList = [];
  int _topOfTheStack = -1;

  List<E> get theList => _theList;

  void push(E theItem) {
    theList.add(theItem);
    _topOfTheStack++;
  }

  E pop() {
    E backup = _theList[_topOfTheStack];
    theList.removeAt(_topOfTheStack);
    _topOfTheStack--;
    return backup;
  }

  E peek() {
    return theList[_topOfTheStack];
  }

  bool isEmpty() {
    return _topOfTheStack == -1;
  }
}
