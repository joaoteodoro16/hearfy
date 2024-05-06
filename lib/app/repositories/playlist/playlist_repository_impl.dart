import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hear_fy/app/core/constants/constants.dart';
import 'package:hear_fy/app/core/exceptions/app_rate_limits_exception.dart';
import 'package:hear_fy/app/core/exceptions/expired_token_exception.dart';
import 'package:hear_fy/app/core/exceptions/oauth_incorrect_exception.dart';
import 'package:hear_fy/app/core/models/playlist/playlist_model.dart';
import 'package:hear_fy/app/core/rest_client/spotify_rest_client.dart';

import './playlist_repository.dart';

class PlaylistRepositoryImpl implements PlaylistRepository {
  final SpotifyRestClient _spotifyRestClient;

  PlaylistRepositoryImpl({required SpotifyRestClient spotifyRestClient})
      : _spotifyRestClient = spotifyRestClient;

  @override
  Future<PlaylistModel> getAllByUser() async {
    try {
      final result = await _spotifyRestClient
          .auth()
          .get('/users/${Constants.USER_ID}/playlists?limit=50&offset=0');

      if (result.statusCode == 200) {
        final PlaylistModel playlist = PlaylistModel.fromMap(result.data);
        return playlist;
      }
      
      throw Exception('Resposta inesperada do servidor');
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 401:
            throw ExpiredTokenException(
                message: "Token inválido ou expirado. ${e.response!.statusMessage}");
          case 403:
            throw OauthIncorrectException(
                message: "Chave do usuário incorreta. ${e.response!.statusMessage}");
          case 429:
            throw AppRateLimitsException(
                message:
                    "O aplicativo excedeu seus limites de taxa. ${e.response!.statusMessage}");
          default:
            log("Erro desconhecido ao buscar listas de reprodução",
                error: e, stackTrace: StackTrace.current);
            throw Exception("Erro desconhecido ao buscar listas de reprodução");
        }
      }else{
        log("Erro de conexão com o servidor", error: e, stackTrace: StackTrace.current);
        throw Exception("Erro de conexão com o servidor");
      }
    } catch (e) {
      log("Erro interno do servidor", error: e, stackTrace: StackTrace.current);
      throw Exception("Erro interno do servidor");
    }
  }
}
