<img src="README_FILES/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="README_FILES/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<img src="README_FILES/badges/Flutter-3.svg" height="28px" />&nbsp;&nbsp;
<img src="README_FILES/badges/dart-null_safety.svg" height="28px"/>

# Hear Fy

## This project aims to consume some features from the API provided by Spotify.

<br>
<p align="center">
  <img src="README_FILES/images/1.png" width="200">
  <img src="README_FILES/images/2.png" width="200">
  <img src="README_FILES/images/3.png" width="200">
</p>

<p align="center">
  <a href="">
    <img src="README_FILES/images/apk_download.png" alt="Time Sense" style="display: inline-block; width: 200px;"/>
  </a>
</p>

## Features
* Fetch public playlists by a specific user's ID
* List tracks from a playlist
* Play tracks (set to play only the preview of each track)
* Skip and go back between tracks using navigation buttons

## Dependencies
<details>
     <summary> Read more </summary>

* [dio](https://pub.dev/packages/dio)
* [get](https://pub.dev/packages/get)
* [loading_animation_widget](https://pub.dev/packages/loading_animation_widget)
* [just_audio](https://pub.dev/packages/just_audio)

    </details>

## How to run the project

### Flutter version used: 3.16.5
When opening the project on your machine, make sure to run `flutter pub get` in the terminal.

Step 1: Go to the Spotify Developer Dashboard
https://developer.spotify.com/dashboard

Step 2: Create an App on the Spotify platform
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/737551eb-c1b1-49c2-9922-18d312e2c608)
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/e5091df1-0e95-45c2-a61f-521edd6c30b9)

Step 3: After creating the App, a Client ID and a Client Secret will be generated — these are required to consume the API
![Screenshot_1](https://github.com/joaoteodoro16/hearfy/assets/78423868/dfd775a8-d239-427b-bb05-d474e1ee4e43)

Step 4: Inside the project, locate the `constants.dart` file — this is where you will insert the Client ID and Client Secret obtained from the platform
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/4f8dfce5-db8d-4f05-832f-58b08c5a8532)

Step 5: A random user ID is already included in the project code. However, if you want to use your own profile, just grab the link to your Spotify account and copy this portion of the URL
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/add69b3a-0d03-4bcb-bb9d-9abbbb2e1981)

For more information about the API and future implementations, check the official documentation:
- https://developer.spotify.com/documentation/web-api/tutorials/getting-started

## Folder Structure
<details>
     <summary> Click to expand </summary>

```
lib
 ┣ app
 ┃ ┣ core
 ┃ ┃ ┣ bindings
 ┃ ┃ ┃ ┗ application_bindings.dart
 ┃ ┃ ┣ constants
 ┃ ┃ ┃ ┗ constants.dart
 ┃ ┃ ┣ exceptions
 ┃ ┃ ┃ ┣ app_exception.dart
 ┃ ┃ ┃ ┣ app_rate_limits_exception.dart
 ┃ ┃ ┃ ┣ expired_token_exception.dart
 ┃ ┃ ┃ ┗ oauth_incorrect_exception.dart
 ┃ ┃ ┣ mixins
 ┃ ┃ ┃ ┣ loading_mixin.dart
 ┃ ┃ ┃ ┗ messages_mixin.dart
 ┃ ┃ ┣ models
 ┃ ┃ ┃ ┣ playlist
 ┃ ┃ ┃ ┃ ┣ artist_model.dart
 ┃ ┃ ┃ ┃ ┣ playlist_banner_model.dart
 ┃ ┃ ┃ ┃ ┣ playlist_items_model.dart
 ┃ ┃ ┃ ┃ ┣ playlist_model.dart
 ┃ ┃ ┃ ┃ ┣ playlist_tracks_model.dart
 ┃ ┃ ┃ ┃ ┗ playlist_track_model.dart
 ┃ ┃ ┃ ┗ album_model.dart
 ┃ ┃ ┣ rest_client
 ┃ ┃ ┃ ┣ spotify_auth_interceptor.dart
 ┃ ┃ ┃ ┗ spotify_rest_client.dart
 ┃ ┃ ┣ ui
 ┃ ┃ ┃ ┗ app_colors.dart
 ┃ ┃ ┗ util
 ┃ ┃ ┃ ┗ format_util.dart
 ┃ ┣ modules
 ┃ ┃ ┣ home
 ┃ ┃ ┃ ┣ widgets
 ┃ ┃ ┃ ┃ ┗ playlist_item_widget.dart
 ┃ ┃ ┃ ┣ home_bindings.dart
 ┃ ┃ ┃ ┣ home_controller.dart
 ┃ ┃ ┃ ┗ home_page.dart
 ┃ ┃ ┗ track
 ┃ ┃ ┃ ┣ widgets
 ┃ ┃ ┃ ┃ ┣ player_widget.dart
 ┃ ┃ ┃ ┃ ┗ track_item_widget.dart
 ┃ ┃ ┃ ┣ track_bindings.dart
 ┃ ┃ ┃ ┣ track_controller.dart
 ┃ ┃ ┃ ┗ track_page.dart
 ┃ ┣ repositories
 ┃ ┃ ┣ playlist
 ┃ ┃ ┃ ┣ playlist_repository.dart
 ┃ ┃ ┃ ┗ playlist_repository_impl.dart
 ┃ ┃ ┗ tracks
 ┃ ┃ ┃ ┣ tracks_repository.dart
 ┃ ┃ ┃ ┗ tracks_repository_impl.dart
 ┃ ┣ routes
 ┃ ┃ ┣ home_routers.dart
 ┃ ┃ ┗ track_routers.dart
 ┃ ┗ services
 ┃ ┃ ┗ tracks
 ┃ ┃ ┃ ┣ track_service.dart
 ┃ ┃ ┃ ┗ track_service_impl.dart
 ┗ main.dart
```

</details>
