import 'dart:collection';
import 'dart:math';
import 'package:examples/Algorithms/knapsack_problem.dart';
import 'package:examples/Algorithms/linked_list.dart';
import 'package:examples/Algorithms/quick_sort.dart';
import 'package:examples/OOP/association.dart';
import 'package:examples/OOP/oop.dart';
import 'package:examples/SOLID/dependency_inversion_principle.dart';
import 'Algorithms/linked_list_with_dart_help.dart';

void main() {
  /////////////////////////////////////////////////////////
  //////////////////////// О О П //////////////////////////
  FrontEndDeveloper frontEndDeveloper = FrontEndDeveloper('Maks');
  //frontEndDeveloper._name=''; невозможно
  frontEndDeveloper.writeCode();

  //Агрегация
  EngineAggregation engineAggregation = EngineAggregation(300);
  CarAggregation carBMW = CarAggregation(engineAggregation);
  print(carBMW);
  //Композиция
  CarComposition carCadillac = CarComposition();
  print(carCadillac);

  ///////////////////////////////////////////////////////////
  ///////////////////////  S O L I D  ///////////////////////
  //dependency inversion
  //YandexMusicApi api=YandexMusicApi();
  //api.get();
  //затем начинаем работать с SpotifyApi
  SpotifyApi api = SpotifyApi(); // нам необходимо менять и создание класса
  api.findAll(); // и вызов соотв им методов

  MusicApi apiDIP = MusicClient(YandexMusicApiDIP());
  apiDIP.getTracks();
  //можем изменить поведение и сделать это только в одном месте

  /////////////////////////////////////////////////////////////////////
  ////////////////////////  S O R T S   ///////////////////////////////

  /////// QUICK SORT ///////
  print('QUICK SORT');
  List<int> arr = [3, 0, 1, 8, 7, 2, 5, 4, 9, 6];
  print('without sort:');
  print(arr);
  sort(arr, 0, 9);
  print('sorted:');
  print(arr);

  ///// KNAPSACK PROBLEM /////
  print('KNAPSACK PROBLEM');
  List<int> weights = [3, 4, 5, 8, 9];
  List<int> prices = [1, 6, 4, 7, 6];
  int count = weights.length;
  int N = 13;
  final A = List.generate(count + 1, (counter) => List.generate(N + 1, (counter) => 0));
  //составляем таблицу стоимости
  for (int k = 0; k <= count; k++) {
    for (int s = 0; s <= N; s++) {
      if (k == 0 || s == 0) {
        A[k][s] = 0; //если размер набора =0 или размер рюкзака =0
      } else {
        if (s >= weights[k - 1]) {
          //если размер рюкзака >= размера текущего предмета,
          // то max стоимость набора
          A[k][s] = max(A[k - 1][s], A[k - 1][s - weights[k - 1]] + prices[k - 1]);
          //рассм 2 случая когда предмет кладется и не кладется в рюкзак
        } else {
          A[k][s] = A[k - 1][s];
          //предмет в рюкзак не влезет
        }
      }
    }
  }
  for (int i = 0; i < A.length; i++) {
    print(A[i]);
  }
  List<int> result = [];
  traceResult(A, weights, count, N, result);
  print("Оптимальное содержимое рюкзака: $result");

  ////////// LINKED LIST ///////////
  final linkedListDart = LinkedList<EntryItem>();
  linkedListDart.addAll([
    EntryItem(1, 'A'),
    EntryItem(2, 'B'),
    EntryItem(3, 'C'),
  ]);
  print(linkedListDart.first); // 1 : A
  print(linkedListDart.last); // 3 : C

  linkedListDart.first.insertAfter(EntryItem(15, 'E'));
  linkedListDart.last.insertBefore(EntryItem(10, 'D'));

  for (var entry in linkedListDart) {
    print(entry);
  }
  // 1 : A
  // 15 : E
  // 2 : B
  // 10 : D
  // 3 : C
  linkedListDart.elementAt(2).unlink();
  print(linkedListDart); // (1 : A, 15 : E, 10 : D, 3 : C)
  linkedListDart.first.unlink();
  print(linkedListDart); // (15 : E, 10 : D, 3 : C)
  linkedListDart.remove(linkedListDart.last);
  print(linkedListDart); // (15 : E, 10 : D)
  linkedListDart.clear();
  print(linkedListDart.length); // 0
  print(linkedListDart.isEmpty);

  //////////////////// Custom Linked List //////////////////

  final linkedList = CustomLinkedList<int>();

  linkedList.add(5);
  linkedList.add(10);
  linkedList.add(15);
  linkedList.add(25);
  linkedList.add(35);

  linkedList.printList(); //5 10 15

  linkedList.remove(25);

  linkedList.printList();
}
