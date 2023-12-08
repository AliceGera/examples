import 'package:examples/OOP/association.dart';
import 'package:examples/OOP/oop.dart';

void main() {
  //ООП
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
}
