import '../models/user.dart';

class UserService {
  User getCurrentUser() {
    // Contoh data statis
    return User(name: 'Max Rumbo', email: 'maxrumbo@email.com');
  }
}
