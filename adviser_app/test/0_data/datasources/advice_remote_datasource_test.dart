import 'package:adviser_app/0_data/datasources/advice_remote_datasource.dart';
import 'package:adviser_app/0_data/exceptions/exceptions.dart';
import 'package:adviser_app/0_data/models/advise_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'advice_remote_datasource_test.mocks.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('should return AdviceModel', () {
      test('when Client response was 200 and has valid data', () async {
        final mockClient = MockClient();

        final adviceRemoteDataSourceTest =
            AdviceRemoteDataSourceImpl(client: mockClient);
        const responseBody = '{"advice": "test advice", "advice_id": 1}';

        when(mockClient.get(
                Uri.parse('https://api.flutter-community.com/api/v1/advice'),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((realInvocation) => Future.value(
                  Response(responseBody, 200),
                ));

        final result =
            await adviceRemoteDataSourceTest.getRandomAdviceFromApi();
        expect(result, AdviceModel(advice: 'test advice', id: 1));
      });
    });

    group('should throw', () {
      test('a ServerExcerption when Client response was not 200', () async {
        final mockClient = MockClient();

        final adviceRemoteDataSourceTest =
            AdviceRemoteDataSourceImpl(client: mockClient);

        when(mockClient.get(
                Uri.parse('https://api.flutter-community.com/api/v1/advice'),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((realInvocation) => Future.value(
                  Response('Server Error', 201),
                ));

        expect(() => adviceRemoteDataSourceTest.getRandomAdviceFromApi(),
            throwsA(isA<ServerException>()));
      });
    });

    group('should throw', () {
      test(
          'a Type Error when Client response was not 200 and has no Valid Data',
          () async {
        final mockClient = MockClient();
        final adviceRemoteDataSourceTest =
            AdviceRemoteDataSourceImpl(client: mockClient);
        const responseBody = '{"advice": "test advice"}';

        when(mockClient.get(
                Uri.parse('https://api.flutter-community.com/api/v1/advice'),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((realInvocation) => Future.value(
                  Response(responseBody, 200),
                ));

        expect(() => adviceRemoteDataSourceTest.getRandomAdviceFromApi(),
            throwsA(isA<TypeError>()));
      });
    });
  });
}
