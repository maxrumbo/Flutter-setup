
## Flutter Notes & To-Do App

This is a simple Flutter application for managing notes and to-do lists, with user authentication and modern app structure.

### Features
- User sign up, login, and logout
- Add, edit, and delete notes
- Add, check, and delete to-do items
- Profile page and theme (dark/light mode)
- Backup & restore (template)
- Reminder (template)

### How to Run
1. Make sure you have [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
2. Open terminal in the project folder:
	```
	cd path/to/your/project
	flutter pub get
	flutter run
	```
3. Use an emulator/device (Android/iOS) or run on Windows/Web after running `flutter create .`

### Folder Structure
- `lib/pages/` : All app pages (notes, todos, auth, profile, etc)
- `lib/models/` : Data models
- `lib/services/` : Business logic & storage
- `lib/widgets/` : Reusable UI components
- `lib/utils/` : Utilities

---
Made with Flutter ❤️
