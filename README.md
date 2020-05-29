# Highvibe

HighVibe.Network is a blockchain-based ecosystem designed to incentivize personal growth.

## Meta

- **State:** development
- **Point People:** [@7flash](https://github.com/7flash)
- **CI :** [![GitHub](https://github.com/HighVibe/hvn/workflows/CI/badge.svg?branch=master)](https://github.com/HighVibe/hvn/actions)

## Development Process

All stories and bugs are tracked in [GITHUB][]. Development occurs on branches that are tested with the `test`.The PR is reviewed and then merged into the `develop` branch.

To get started, see [Contributing](#contributing)

## Requirements

- Flutter: the latest version on `flutter beta channel`
- Dart: 2.8.1+
- Xcode: 11.4.0+
- Androind Studio 3.6.0+
- Ruby: 2.6.0+
- CocoaPods: 1.8.4+
- Flutter & Dart plugins:
  - [Visual Studio Code](https://flutter.dev/docs/get-started/editor?tab=androidstudio)
  - [Android Studio / IntelliJ](https://flutter.dev/docs/get-started/editor?tab=vscode)

## Setup

```sh
git clone https://github.com/HighVibe/hvn.git && \
cd hvn && \
flutter packages get && \
flutter pub run build_runner build --delete-conflicting-outputs && \
flutter run
```

### Update App Icon
```
flutter pub run flutter_launcher_icons:main
```

### Codecov (_WIP_)

You can use [Codecov](https://codecov.io) automatically as long as the repository's owner is a paid Codecov member (assuming this is a private repo).

## Architecture (_WIP_)

### Implementation Guidance (_WIP_)

1. To view dependencies, view the [pubspec.yaml](pubspec.yaml).

2. This project use [built_value](https://pub.dev/packages/built_value), [built_collection](https://pub.dev/packages/built_collection) and [built_test](https://pub.dev/packages/built_value_test) packages which add value types (imitable values) to Dart.
   Make sure you use these package for model definitions, object serialization/deserialization, and any other appropriate use cases.

      <details><summary>Learn more about built_value and value types.</summary>
      <p>

   Why built_value ?

   - Built value [generates a huge amount of code for free](https://github.com/HighVibe/hvn/blob/master/lib/models/user/user.g.dart)
   - Built values are value types(immutable values) and not reference types [1](https://en.wikipedia.org/wiki/Value_type_and_reference_type), [2](https://www.raywenderlich.com/9481-reference-vs-value-types-in-swiftt), [3](https://www.tutorialsteacher.com/csharp/csharp-value-type-and-reference-type) . Consequently, it's faster.
   - JSON object serialization and deserialization (**generated for free**)
   - HashCode properties (**generated for free**)
   - Objects equality (**generated for free**)
   - toString methods (**generated for free**)
   - Getter memoization (**generated for free**)
   - [EnumClass](https://www.geeksforgeeks.org/enum-classes-in-c-and-their-advantage-over-enum-datatype/)
   - Dramatically improves [testability](https://pub.dev/packages/built_value_test)
   - Tooling - [VSCode extension](https://marketplace.visualstudio.com/items?itemName=GiancarloCode.built-value-snippets), [IntelliJ plugin](https://plugins.jetbrains.com/plugin/13786-built-value-snippets)
   - Has companion pub [built_collection](https://pub.dev/packages/built_collection) for collections
   - And [more](https://pub.dev/packages/built_value)

   Last but not least, [built_value](https://pub.dev/packages/built_value) widely used in products like Google AdWords.

   #### Articles

   - [`built_value` for Immutable Object Models](https://medium.com/@davidmorgan_14314/darts-built-value-for-immutable-object-models-83e2497922d4#.48dyezxcl)
   - [`built_value` for Serialization](https://medium.com/@davidmorgan_14314/darts-built-value-for-serialization-f5db9d0f4159#.h12y94wu7)
   - [Building a Chat App in Dart](https://medium.com/@davidmorgan_14314/building-a-chat-app-in-dart-815fcd0e5a31#.ku4vtbmk2)
   - [End to End Testing in One Short Second with Dart](https://medium.com/@davidmorgan_14314/end-to-end-testing-in-one-short-second-with-dart-e699c8146fd6#.c7xfxohg4)
   - [Moving Fast with Dart Immutable Values](https://medium.com/@davidmorgan_14314/moving-fast-with-dart-immutable-values-1e717925fafb)
   - [Flutter JSON Serialization](https://aloisdeniel.github.io/flutter-json-serialization/)
   - [Flutter TODO App Example](https://gitlab.com/brianegan/flutter_architecture_samples/tree/master/example/built_redux)
     using `built_value`, [built_redux](https://pub.dev/packages/built_redux), and [flutter_built_redux](https://pub.dev/packages/flutter_built_redux)
   - [Building a (large) Flutter app with Redux](https://hillelcoren.com/2018/06/01/building-a-large-flutter-app-with-redux/)
   - [Some Options for Deserializing JSON with Flutter](https://medium.com/flutter-io/some-options-for-deserializing-json-with-flutter-7481325a4450)

   #### Tutorials

   - [Custom Serializers](https://medium.com/@solid.goncalo/creating-custom-built-value-serializers-with-builtvalueserializer-46a52c75d4c5)
   - [Flutter + built_value + Reddit Tutorial](https://steemit.com/utopian-io/@tensor/building-immutable-models-with-built-value-and-built-collection-in-dart-s-flutter-framework);
     [video](https://www.youtube.com/watch?v=hNbOSSgpneI);
     [source code](https://github.com/tensor-programming/built_flutter_tutorial)

</details>

## Contributing (_WIP_)

### Dependencies

When adding a dependency is necessary it should be managed using pub.

### Branching

Both branches `develop` and `master` are protected and should only be modified by filing a pull request. `develop` represents the latest accepted changes and `master` should represent the latest **shippable** source.

Development should take place on a development branch cut from the existing `develop` branch. Before merging all development branches should be rebased off of `develop`. _Please_ do not merge `develop` upstream.

Development branches should follow the convention: `{bugfix | feature}/{developer initials}-{JIRA_ID or GITHUB_ID}`

Release branches should be tagged and cut from `master` as: `release-0.0.0`.

### Testing

All non-trivial code should be tested. Contributors are encouraged to use [TDD](https://en.wikipedia.org/wiki/Test-driven_development) or [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development) where applicable.

All development branches must pass CI before merging.
Save yourself some trouble and run `flutter test test/all.dart` before filing a pull request.
