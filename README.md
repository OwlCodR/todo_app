# :iphone: Todo App

> New Flutter app that helps people to track their tasks every day

## :package: Stack
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [freezed](https://pub.dev/packages/freezed)
- [riverpod](https://pub.dev/packages/riverpod)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_analytics](https://pub.dev/packages/firebase_analytics)
- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics)
- [firebase_remote_config](https://pub.dev/packages/firebase_remote_config)
- [dio](https://pub.dev/packages/dio)
- [hive](https://pub.dev/packages/hive)
- [logger](https://pub.dev/packages/logger)
- [intl](https://pub.dev/packages/intl)
- [uuid](https://pub.dev/packages/uuid)
- [flutter_slidable](https://pub.dev/packages/flutter_slidable)
- [sliver_tools](https://pub.dev/packages/sliver_tools)
- [platform_device_id](https://pub.dev/packages/platform_device_id)
- [dropdown_button2](https://pub.dev/packages/dropdown_button2)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- [shake](https://pub.dev/packages/shake)

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
> Cleanliness of the code and the overall structure of the project
- :bangbang: Up-to-date README.md
- Added and works `flutter_lints`, there are no unreasonable rule ignores in the code
- Code formatting is present
- [new] The code is divided into layers (layer-first)
> Receiving and storing data
- Implemented handling of server and other errors where they can often shoot
- The application works properly without the Internet
- :sparkles: Offline-first: work without the Internet is fully possible, at the next start it will send what could not leave in the previous session due to errors / lack of network
> Navigation, UI, animations
- Navigation is encapsulated in a separate entity, there are no explicit Navigator.push transitions directly in callbacks
- The text of long notes is cut to fit the layout
- Dark theme support
- Implemented animations for tasks disappearing and screen transitions 
- Implemented support for landscape orientation
- Implemented support for large screens (tablets)
> Architecture
- Working with data is organized in a separate entity, a repository, encapsulating in one place the receipt and updating / adding of data to disk
- State-management is implemented using `Riverpod`
- [new] DI using `Riverpod`
> Deeplinks
- Supported deep link that opens the screen for adding a new case `adb shell 'am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "https://deeplink.yandex-todo-app.com/new"'`
- Deeplink opens even if the app was killed
- Navigation layer rewritten to `Navigator 2.0`
> Build & Release
- 2 flavors are supported: dev and prod. In the debug version, a debug label is added in the corner of the application and the suffix [DEV] is added
- Set up CI on GitHub using `Github Actions`
- :sparkles: There is distribution through some service like Firebase App Distribution (Implemented using Github Actions, but crashes with 403 due to problems with the Russia region)
> Additionally
- Using `freezed` for data-models
- Added analytics tool using `firebase_analytics`. Event analytics is collected: `app_open`, `first_open`, `TASK_COMPLETED`, `TASK_ADDED`, `TASK_DELETED`
- :sparkles: Added theme changing on shaking using `shake`

## :video_game: Screenshots
<img src="https://github.com/OwlCodR/todo_app/blob/phase/2/screenshots/3.jpg" width="250"><img src="https://github.com/OwlCodR/todo_app/blob/phase/2/screenshots/4.jpg" width="250"><img src="https://github.com/OwlCodR/todo_app/blob/phase/2/screenshots/6.jpg" width="250"><img src="https://github.com/OwlCodR/todo_app/blob/phase/2/screenshots/7.jpg" width="250">

<img src="https://github.com/OwlCodR/todo_app/blob/phase/2/screenshots/5.jpg" width="700">

## :link: Download
> [DEV] https://disk.yandex.ru/d/k1vRWSUt41q7ww

> [PROD] https://disk.yandex.ru/d/7gRjvnXp1BG6_A

### :memo: Other
> Freezed

`flutter pub run build_runner build`

> Deeplinks

`adb shell 'am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "https://deeplink.yandex-todo-app.com/new"'`
