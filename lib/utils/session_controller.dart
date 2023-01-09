import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class UserSession {
  // Create a store for the user's session data
  final store = stringMapStoreFactory.store('user');

  // Get a writable directory to store the database file
  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return '${documentsDirectory.path}/user.db';
  }

  // Open the database file
  Future<Database> get db async =>
      await databaseFactoryIo.openDatabase(await _dbPath);

  // Save the user's session data to the store
  Future<void> saveUserSession() async {
    await store.add(await db, {'is_logged_in': true});
  }

  // Retrieve the user's session data from the store
  Future<Map<String, dynamic>?> getUserSession() async {
    var record = await store.findFirst(await db);
    return record?.value;
  }

  // Clear the user's session data
  Future<void> clearUserSession() async {
    await store.delete(await db);
  }

  // Check if the user is logged in
  Future<bool> isLoggedIn() async {
    Map<String, dynamic>? userData = await getUserSession();
    if (userData == null) {
      return false;
    }
    return userData['is_logged_in'];
  }
}

