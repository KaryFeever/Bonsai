# Flutter basic example

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
## Clone the repo 
```
$ git clone git@github.com:KaryFeever/BUT_FIT_ITU.git
$ cd BUT_FIT_ITU
$ git checkout flutter_basic_example
```
## Run the app 
```
$ cd basic_example
$ flutter run
```

## [Set up VSCode](https://docs.flutter.dev/get-started/editor)
