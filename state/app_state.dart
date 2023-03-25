import '../models/api_model.dart';
import 'cubitt.dart';


abstract class NewsState{

}

class InitNewsState extends NewsState{}
class LoadingNewsState extends NewsState{}
class ErrorNewsState extends NewsState{
  final String message;
  ErrorNewsState(this.message);
}
class ResponseNewsState extends NewsState{
  final List<Newss> newss;
  ResponseNewsState(this.newss);
}