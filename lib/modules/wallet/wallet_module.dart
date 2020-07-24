import 'package:highvibe/main.dart';
import 'package:highvibe/modules/wallet/data/fetchEtherscanData.dart';
import 'package:highvibe/modules/wallet/pages/transactions/transactions_page.dart';
import 'package:highvibe/modules/wallet/processing_transaction_page.dart';
import 'package:highvibe/modules/wallet/qrcode_reader_page.dart';
import 'package:highvibe/modules/wallet/service/address_service.dart';
import 'package:highvibe/modules/wallet/service/configuration_service.dart';
import 'package:highvibe/modules/wallet/service/contract_service.dart';
import 'package:highvibe/modules/wallet/stores/wallet_create_store.dart';
import 'package:highvibe/modules/wallet/stores/wallet_import_store.dart';
import 'package:highvibe/modules/wallet/stores/wallet_store.dart';
import 'package:highvibe/modules/wallet/stores/wallet_transactions_store.dart';
import 'package:highvibe/modules/wallet/stores/wallet_transfer_store.dart';
import 'package:highvibe/modules/wallet/wallet_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/wallet/wallet_create_page.dart';
import 'package:highvibe/modules/wallet/wallet_import_page.dart';
import 'package:highvibe/modules/wallet/wallet_main_page.dart';
import 'package:highvibe/modules/wallet/wallet_page.dart';
import 'package:highvibe/modules/wallet/wallet_transfer_page.dart';
import 'package:highvibe/modules/wallet/pages/receive/receive_page.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart';

class WalletModule extends ChildModule {
  static String wallet = 'wallet';

  @override
  List<Bind<Object>> get binds => [
        Bind<ConfigurationService>(
          (i) => ConfigurationService(sharedPrefs),
        ),
        Bind<FetchEtherscanData>((i) => FetchEtherscanData.create(
              i.get<ConfigurationService>(),
            )),
        Bind<ContractService>(
          (i) => ContractService(
              Web3Client(walletConfig.web3HttpUrl, Client(),
                  socketConnector: () {
                return IOWebSocketChannel.connect(
                  walletConfig.web3RdpUrl,
                ).cast<String>();
              }),
              contract),
        ),
        Bind<AddressService>((i) => AddressService(
              i.get<ConfigurationService>(),
            )),
        Bind<WalletController>((i) => WalletController(
              i.get<ConfigurationService>(),
            )),
        Bind<WalletStore>((i) => WalletStore(
              i.get<ContractService>(),
              i.get<AddressService>(),
              i.get<ConfigurationService>(),
            )),
        Bind<WalletCreateStore>((i) => WalletCreateStore(
              i.get<WalletStore>(),
              i.get<AddressService>(),
            )),
        Bind<WalletImportStore>((i) => WalletImportStore(
              i.get<WalletStore>(),
              i.get<AddressService>(),
            )),
        Bind<WalletTransferStore>((i) => WalletTransferStore(
              i.get<WalletStore>(),
              i.get<ContractService>(),
            )),
        Bind<WalletTransactionsStore>((i) => WalletTransactionsStore(
              i.get<WalletStore>(),
            )),
      ];

  @override
  List<Router<Object>> get routers => [
        Router('/$wallet', child: (_, args) => const WalletPage()),
        Router(
          '/$wallet/main-page',
          child: (_, args) => WalletMainPage(),
        ),
        Router(
          '/$wallet/create',
          child: (_, args) => WalletCreatePage(),
        ),
        Router(
          '/$wallet/import',
          child: (_, args) => WalletImportPage(),
        ),
        Router(
          '/$wallet/transfer',
          child: (_, args) => WalletTransferPage(),
        ),
        Router(
          '/$wallet/processing-transaction',
          child: (_, args) => ProcessingTransactionPage(),
        ),
        Router(
          '/$wallet/qrcode_reader',
          child: (_, args) => QRCodeReaderPage(
            onScanned: args.data,
          ),
        ),
        Router(
          '/$wallet/transactions',
          child: (_, args) => TransactionsPage(),
        ),
        Router(
          '/$wallet/receive',
          child: (_, args) => ReceivePage(),
        ),
      ];

  static Inject<WalletModule> get to => Inject<WalletModule>.of();

  static Future<Object> toWallet() => Modular.to.pushNamed(wallet);
  static Future<Object> toMainPage() =>
      Modular.to.pushNamed('$wallet/main-page');
  static Future<Object> toCreate() => Modular.to.pushNamed('$wallet/create');
  static Future<Object> toImport() => Modular.to.pushNamed('$wallet/import');
  static Future<Object> toTransfer() =>
      Modular.to.pushNamed('$wallet/transfer');
  static Future<Object> toProcessingTransaction() =>
      Modular.to.pushNamed('$wallet/processing-transaction');
  static Future<Object> toQrCodeReader({ Function callback }) =>
      Modular.to.pushNamed('$wallet/qrcode_reader', arguments: callback);
  static Future<Object> toTransactions() =>
      Modular.to.pushNamed('$wallet/transactions');
  static Future<Object> toReceive() =>
      Modular.to.pushNamed('$wallet/receive');
}
