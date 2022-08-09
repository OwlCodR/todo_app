# :iphone: Todo App

> New Flutter app that helps people to track their tasks every day

## :package: Stack
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [freezed](https://pub.dev/packages/freezed)
- [riverpod](https://pub.dev/packages/riverpod)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics)
- [dio](https://pub.dev/packages/dio)
- [hive](https://pub.dev/packages/hive)
- [logger](https://pub.dev/packages/logger)
- [intl](https://pub.dev/packages/intl)
- [uuid](https://pub.dev/packages/uuid)
- [flutter_slidable](https://pub.dev/packages/flutter_slidable)
- [sliver_tools](https://pub.dev/packages/sliver_tools)
- [platform_device_id](https://pub.dev/packages/platform_device_id)

## :sparkles: Feature list
**I phase:**
- :bangbang: Up-to-date README.md
- Logging using `logger`
- Internationalization using `intl`
- Localized app name
- Limitation of long texts in the task's title
- Swipe on item Done/Delete using `flutter_slidable`
- Code formatting is present
- The code is divided into features and layers
- Added and works `flutter_lints`, there are no unreasonable rule ignores in the code
- Working with asynchronous code is implemented uniformly: there is no incoherent mess of `.then` and `async`/`await`, the approach is logical
- Implemented work with the backend, data is sent/received from the server using `Dio`
- :sparkles: Work with the network is separated into a separate layer (`Repository`/`Datasource`), the code is encapsulated. Missing logic in presentation layer
- Organized saving data to disk using `Hive`
- :sparkles: The work is selected in a separate layer (`Repository`/`Datasource`)
- `Riverpod` is used for state management
- DI using `Riverpod`
- Firebase Crashlytics is connected to the project using `firebase_core` & `firebase_crashlytics`

**II phase:**
- Using `freezed` for data-models

## :video_game: Screenshots
![Screen1](https://github.com/OwlCodR/todo_app/blob/feature/readme/screenshots/1.jpg?raw=true)
![Screen2](https://github.com/OwlCodR/todo_app/blob/feature/readme/screenshots/2.jpg?raw=true)

## :link: Download
https://disk.yandex.ru/d/QxJBJpDqMR2ILw

### :memo: Other
> Freezed
`flutter pub run build_runner build`
