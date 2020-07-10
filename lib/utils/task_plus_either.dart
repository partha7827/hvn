import 'package:dartz/dartz.dart';

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

extension TaskPlusEither<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return map(
      (either) => either.leftMap(
        (obj) {
          try {
            return obj as Failure;
          } catch (error) {
            throw obj;
          }
        },
      ),
    );
  }
}
