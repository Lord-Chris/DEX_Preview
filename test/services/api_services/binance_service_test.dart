import 'package:dao_preview/core/app/_app.dart';
import 'package:dao_preview/models/_models.dart';
import 'package:dao_preview/services/api_services/binance_service/binance_service.dart';
import 'package:dao_preview/services/core_services/network_service/i_network_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/service_helpers.dart';

void main() {
  group('Binance Service Test - ', () {
    late INetworkService networkService;
    late BinanceService binanceService;

    setUp(() {
      registerServices();
      networkService = locator<INetworkService>();
      binanceService = BinanceService();
    });

    tearDown(() {
      unregisterServices();
    });

    group('fetchCandles - ', () {
      final res = [
        [
          1499040000000, // Kline open time
          '0.01634790', // Open price
          '0.80000000', // High price
          '0.01575800', // Low price
          '0.01577100', // Close price
          '148976.11427815', // Volume
          1499644799999, // Kline close time
          '2434.19055334', // Quote asset volume
          308, // Number of trades
          '1756.87402397', // Taker buy base asset volume
          '28.46694368', // Taker buy quote asset volume
          '0' // Unused field. Ignore.
        ]
      ];

      test('Should return a list of CandleData objects', () async {
        when(() => networkService.get(any())).thenAnswer((_) async => res);

        final candles = await binanceService.fetchCandles('BTCUSDT', '1m');

        expect(candles.length, 1);
        expect(candles.first.open, 0.01634790);
      });

      test('Should throw a Failure when the network request fails', () async {
        when(() => networkService.get(any())).thenThrow(InternetFailure());

        IFailure? failure;
        try {
          await binanceService.fetchCandles('BTCUSDT', '1m');
        } on IFailure catch (e) {
          failure = e;
        }

        expect(failure, isNotNull);
      });
    });
  });
}
