import 'package:garden/repository/local/response/failure/failure.dart';

class DatabaseFailure extends Failure {
  DatabaseFailure({required String message}) : super(message: message);
}
