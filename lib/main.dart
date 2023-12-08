import 'package:examples/OOP/association.dart';
import 'package:examples/OOP/oop.dart';
import 'package:examples/SOLID/dependency_inversion_principle.dart';

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

//dependency inversion

//YandexMusicApi api=YandexMusicApi();
//api.get();
//затем начинаем работать с SpotifyApi
  SpotifyApi api = SpotifyApi();
  api.findAll();
//нам необходимо менять и создание класса,и вызов соотв им методов

  MusicApi apiDIP = MusicClient(YandexMusicApiDIP());
  apiDIP.getTracks();
//можем изменить поведение и сделать это только в одном месте
}
