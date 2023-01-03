# Bonsai

## Flutter instalation
If you are using ``Apple Silicon Mac``
```
$ sudo softwareupdate --install-rosetta --agree-to-license
```

Install the Flutter SDK
- [Intel](https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.2-stable.zip)
- [Apple Silicon](https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.3.2-stable.zip)

```
$ cd
$ mkdir development
$ cd development
$ unzip ~/Downloads/flutter_macos_3.3.2-stable.zip
```
## Update PATH
```
$ vim $HOME/.zshrc
```
Add the following line
```
export PATH="$PATH:[PATH_OF_FLUTTER_GIT_DIRECTORY]/bin"
```
Reopen terminal to apply changes or run next command
```
$ source $HOME/.zshrc
```

## Install Xcode 
- [Web download](https://developer.apple.com/xcode/)
- [Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835)  

Configure Xcode
```
$ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
$ sudo xcodebuild -runFirstLaunch
```

## Flutter plugins
```
$ sudo gem install cocoapods
```
If you are using Apple Silicon Mac run next command additionally
```
$ sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc
```

## Open Simulator
```
$ open -a Simulator
```
Go to `File->Open Simulator->Iphone 11`

## Run the app
```
$ cd bonsai
$ flutter run 
```

## Used plugins
- [cupertino_icons 1.0.2](https://pub.dev/packages/cupertino_icons)
- [flutter_local_notifications 9.5.3+1](https://pub.dev/packages/flutter_local_notifications)
- [flutter_svg: 1.1.6](https://pub.dev/packages/flutter_svg)
- [google_fonts: 3.0.1](https://pub.dev/packages/google_fonts)
- [image_cropper: 3.0.1](https://pub.dev/packages/image_cropper)
- [image_picker: 0.8.6](https://pub.dev/packages/image_picker)
- [get_it_mixin: 3.1.4+2](https://pub.dev/packages/get_it_mixin)
- [intl: 0.17.0](https://pub.dev/packages/intl)
- [proste_bezier_curve: 2.0.2](https://pub.dev/packages/proste_bezier_curve)
- [auto_size_text: 3.0.0](https://pub.dev/packages/auto_size_text)
- [shared_preferences: 2.0.15](https://pub.dev/packages/shared_preferences)
- [flutter_launcher_icons: 0.11.0](https://pub.dev/packages/flutter_launcher_icons)

## Video example
https://user-images.githubusercontent.com/41788036/208754001-da70ffc6-f7bc-46e0-924a-4391f43c2ec5.mp4
