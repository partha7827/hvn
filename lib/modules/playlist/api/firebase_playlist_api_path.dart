class FirebasePlaylistApiPath {
  static String playlist(String userId, String playlistId) =>
      'users/$userId/playlists/$playlistId';
  static String playlistItems(String userId) => 'users/$userId/playlists';
}
