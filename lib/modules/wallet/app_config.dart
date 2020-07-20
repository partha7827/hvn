class AppConfig {
  var infuraApiKey = "<Your Infura API key here>";

  AppConfig() {
    params['dev'] = AppConfigParams(
        "http://192.168.182.2:7546",
        "ws://192.168.182.2:7546",
        "0x59FFB6Ea7bb59DAa2aC480D862d375F49F73915d",
        "development");

    params['ropsten'] = AppConfigParams(
        "https://ropsten.infura.io/v3/$infuraApiKey",
        "wss://ropsten.infura.io/ws/v3/$infuraApiKey",
        "0x7cbec5bcb81fd24db92f401f97c1dd48338f8df8",
        "ropsten");

    params['kovan'] = AppConfigParams(
        "https://kovan.infura.io/v3/$infuraApiKey",
        "wss://kovan.infura.io/ws/v3/$infuraApiKey",
        "not_yet_deployed",
        "kovan");

    params['rinkeby'] = AppConfigParams(
        "https://rinkeby.infura.io/v3/$infuraApiKey",
        "wss://kovan.infura.io/ws/v3/$infuraApiKey",
        "0x7d9abcb2633e17debbafd400ce15003057219cd2",
        "rinkeby");

    params['goerli'] = AppConfigParams(
        "https://goerli.infura.io/v3/$infuraApiKey",
        "wss://goerli.infura.io/ws/v3/$infuraApiKey",
        "not_yet_deployed",
        "goerli");

    params['mainnet'] = AppConfigParams(
        "https://mainnet.infura.io/v3/$infuraApiKey",
        "wss://mainnet.infura.io/ws/v3/$infuraApiKey",
        "0x6ffbd6b41b802550c57d4661d81a1700a502f2ab",
        "mainnet");
  }

  Map<String, AppConfigParams> params = Map<String, AppConfigParams>();
}

class AppConfigParams {
  AppConfigParams(this.web3HttpUrl, this.web3RdpUrl, this.contractAddress, this.network);
  final String web3RdpUrl;
  final String web3HttpUrl;
  final String contractAddress;
  final String network;
}
