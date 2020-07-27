import 'package:chopper/chopper.dart';
import 'package:highvibe/modules/wallet/service/configuration_service.dart';

part 'fetchEtherscanData.chopper.dart';

// IMPORTANT!!!!
// after buildingchange in fetchEtherscanData.chopper.dart
// final $url = '?module=account&action=txlist&startblock=0&endblock=99999999&
// page=1&offset=100&sort=desc&apikey=<your-etherscan-api-key>&
// address=$address';

@ChopperApi(baseUrl: '''?module=account&action=txlist&startblock=0&endblock=99999999&page=1&offset=100&sort=desc&apikey=E9FG8JK1IM7N69JZWXRRTY31UEFBQ9HG9W&address=''')
abstract class FetchEtherscanData extends ChopperService {
  @Get(path: '{address}')
  Future<Response<dynamic>> fetchData(@Path('address') String address);
  @Post()
  Future<Response<dynamic>> postData(@Body() Map<String, dynamic> body);

  static FetchEtherscanData create(ConfigurationService configurationService) {
  
    //etherscan API
    var etherscanNetwork = 'api';
    if (configurationService.getNetwork() != 'mainnet') {
      etherscanNetwork = 'api-${configurationService.getNetwork()}';
    }

    final client = ChopperClient(
      baseUrl: 'https://$etherscanNetwork.etherscan.io/api',
      services: [_$FetchEtherscanData()],
      converter: const JsonConverter(),
    );
    return _$FetchEtherscanData(client);
  }
}