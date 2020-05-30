import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class BlockchainRepository extends Disposable {
  // FIXME: - Replace Object with actual type
  Future<Object> fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
