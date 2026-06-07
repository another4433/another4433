// ignore_for_file: file_names
class TheQueue<E> {
  final List<E> _queue = [];

  void enqueue(E element) {
    _queue.add(element);
  }

  E? dequeue() {
    if (_queue.isEmpty) {
      return null;
    }
    return _queue.removeAt(0);
  }

  E? peek() {
    if (_queue.isEmpty) {
      return null;
    }
    return _queue.first;
  }

  bool get isEmpty => _queue.isEmpty;

  int get length => _queue.length;
}
