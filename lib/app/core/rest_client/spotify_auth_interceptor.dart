import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hear_fy/app/core/constants/constants.dart';
import 'package:hear_fy/app/core/rest_client/spotify_rest_client.dart';

class SpotifyAuthInterceptor extends Interceptor {
  final String tokenAccessUrl = "https://accounts.spotify.com/api/token";

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _auth();

    options.headers.addAll({'Authorization': 'Bearer  $accessToken'});

    handler.next(options);
  }

  Future<String> _auth() async {
    try {
      final client = SpotifyRestClient();
      // Chamo meu rest client pq vou ter que buscar o token, ou seja, fazer uma requisição

      final data = {
        'grant_type': 'client_credentials',
        'client_id': Constants.CLIENT_ID,
        'client_secret': Constants.CLIENT_SECRET
      };

      final encodeData = data.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');

      final header = {'content-type': 'application/x-www-form-urlencoded'};

      final response = await client.post(
        tokenAccessUrl,
        data: encodeData,
        options: Options(
          headers: header,
          contentType: 'application/x-www-form-urlencoded',
        ),
      );

      if(response.statusCode == 200){
        return response.data['access_token'];  
      }

      throw Exception("Falha na autenticação: ${response.statusCode} - ${response.statusMessage}");

    } on DioException catch (e) {
      log('Erro na autenticação', error: e,stackTrace: StackTrace.current);
      rethrow;
    }catch(e){
      log('Falha Interna', error: e,stackTrace: StackTrace.current);
      throw Exception("Falha Interna");
    }
  }
}
