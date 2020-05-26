import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/message/message.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final String channelId;
  _ChatControllerBase(this.channelId);

  final appStore = Modular.get<AppStore>();

  final firestore = Modular.get<StoreService>();

  User get currentUser => appStore.currentUser;

  Future<void> sendMessage(String content) async {
    final message = Message((b) => b
      ..content = content
      ..chatId = channelId
      ..authorId = currentUser.id
      ..authorPhotoUrl = currentUser.photoUrl
      ..authorName = currentUser.name);

    final serializedMessage =
        serializers.serializeWith(Message.serializer, message);

    firestore.messageCollection.add(serializedMessage);

    firestore.channelCollection
        .document(channelId)
        .collection("messages")
        .add(serializedMessage);
  }

  Stream<QuerySnapshot> getChannelMessages() {
    return firestore.channelCollection
        .document(channelId)
        .collection("messages")
        .orderBy("createdAt", descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> findMessagesByChannel() {
    return firestore.messageCollection
        .where("channelId", isEqualTo: channelId)
        .orderBy("createdAt", descending: false)
        .snapshots();
  }
}
