import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'data/entity/album_model.dart';
import 'data/entity/counter_model.dart';
import 'domain/fetch_data.dart';
import 'unit_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){


  group("Api test", () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('{"userId": 90, "id": 2}', 200));

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });

  // int add(int a, int b) => a+b;
  // int sub(int a, int b) => a-b;
  // int mult(int a, int b) => a*b;
  // int div(int a, int b) => a~/b;
  //
  // group("Calculation", () {
  //
  //
  //   test("1. Addition", () {
  //     expect(add(2, 3), equals(5));
  //   });
  //
  //   test("2. Subtraction", () {
  //     expect(sub(2, 3), equals(-1));
  //   });
  //
  //   test("3. Multiplication", () {
  //     expect(mult(2, 3), equals(6));
  //   });
  //
  //   test("4. Division", () {
  //     expect(div(2, 3), equals(0));
  //   });
  //
  //
  // });
  //
  // final counter = Counter();
  //
  // counter.increment();
  // counter.increment();
  //
  // test("Counter", (){
  //   expect(counter.counter, equals(2));
  // });

}