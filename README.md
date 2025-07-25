# Clone the project
git clone https://github.com/MohammedEhab0/photo_gallery.git
cd photo_gallery

# Install dependencies
flutter pub get

# Generate *.g.dart and dependency injection files
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
