extension ListChunk<T> on List<T> {
  List<List<T>> chunk(int size) {
    if (size <= 0) {
      throw ArgumentError('Size deve ser maior que zero.');
    }
    List<List<T>> chunks = [];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}
