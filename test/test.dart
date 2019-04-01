import 'dart:math';

void main() {
  Random random = Random();
  List list = [1,2,3,4];
  list.shuffle(random);
  print(list);
}