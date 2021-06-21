abstract class InternalStorageAdapter {
  Future<dynamic> isFavorite(int id);
  Future<void> changeFavorite(int id, bool favorite); 
}
