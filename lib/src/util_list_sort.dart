void _quickSortA(List arr, int low, int high) {
  if (low < high) {
    /* pi is partitioning index, arr[p] is now  
        at right place */
    final int pi = _partitionA(arr, low, high);

    // Separately sort elements before
    // partition and after partition
    _quickSortA(arr, low, pi - 1);
    _quickSortA(arr, pi + 1, high);
  }
}

//This extension will be called on all List<double> for sort
extension ExDoubleSort on List<double> {
  List<double> quickSort() {
    _quickSortA(this, 0, length - 1);
    return this;
  }
}

int _partitionA(List arr, int low, int high) {
  final pivot = arr[high]; // pivot
  int i = low - 1; // Index of smaller element

  for (int j = low; j <= high - 1; j++) {
    // If current element is smaller than the pivot
    if (arr[j].runtimeType == DateTime) {
      if (arr[j].isBefore(pivot) as bool) {
        i++; // increment index of smaller element
        final temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    } else {
      if (arr[j] < pivot as bool) {
        i++; // increment index of smaller element
        final temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  final temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  return i + 1;
}
