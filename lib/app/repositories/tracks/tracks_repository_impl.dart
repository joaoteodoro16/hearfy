import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hear_fy/app/core/exceptions/app_rate_limits_exception.dart';
import 'package:hear_fy/app/core/exceptions/expired_token_exception.dart';
import 'package:hear_fy/app/core/exceptions/oauth_incorrect_exception.dart';
import 'package:hear_fy/app/core/models/playlist/playlist_track_model.dart';
import 'package:hear_fy/app/core/rest_client/spotify_rest_client.dart';

import './tracks_repository.dart';

class TracksRepositoryImpl implements TracksRepository {
  final SpotifyRestClient _spotifyRestClient;

  TracksRepositoryImpl({required SpotifyRestClient spotifyRestClient})
      : _spotifyRestClient = spotifyRestClient;

  @override
  Future<List<PlaylistTrackModel>> getTracks(String urlPlaylist) async {
    try {
      final List<PlaylistTrackModel> tracks = [];

      final result = await _spotifyRestClient.auth().get(urlPlaylist);

      final items = result.data['items'];

      if (items != null && items is List) {
        for (var item in items) {
          final track = item['track'];
          if (track != null) {
            tracks.add(PlaylistTrackModel.fromMap(track));
          }
        }
      }
      if (result.statusCode == 200) {
        return tracks;
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
    }catch (e) {
      log("Erro interno do servidor", error: e, stackTrace: StackTrace.current);
      throw Exception("Erro interno do servidor");
    }
  }
}
