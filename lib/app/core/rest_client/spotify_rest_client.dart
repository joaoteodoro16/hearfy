import 'package:dio/dio.dart';
import 'package:hear_fy/app/core/rest_client/spotify_auth_interceptor.dart';

class SpotifyRestClient extends DioMixin {
//Busca o token de acesso do Spotify
  final String baseUrl = "https://api.spotify.com/v1";


  SpotifyRestClient() {
    httpClientAdapter = HttpClientAdapter();
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    interceptors.add(LogInterceptor(responseBody: true)); //Adicionando Interceptor responsável por nos dar o Log das requisições
  }

  SpotifyRestClient auth(){ //Responsével por adicionar o Interceptor de Autenticação
    interceptors.add(SpotifyAuthInterceptor());
    return this;
  }











}
