import 'package:dio/dio.dart';
import 'package:doctor_appointment_client/data/models/post_model.dart';
import 'package:retrofit/http.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class PostService {
  factory PostService(Dio dio) = _PostService;

  @GET('posts')
  Future<List<PostModel>> getPosts();
}
