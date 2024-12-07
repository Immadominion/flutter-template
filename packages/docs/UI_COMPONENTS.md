# Adding UI Components to Your Flutter App

This guide explains how to add UI components to your Flutter app using custom components. We will demonstrate the creation of a custom button component and provide an example of adding and using it in your app.

## Step 1: Create a Custom Button Component

To get started, create a custom button component in your Flutter project.

### `lib/components/custom_button.dart`

```dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
```

This component creates a reusable button that takes a label and an `onPressed` callback.

## Step 2: Use the Custom Button Component

Once the button component is created, you can import and use it in your app.

### `lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'components/custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: CustomButton(
          label: 'Click Me',
          onPressed: () {
            print('I love the Celo Composer <3');
          },
        ),
      ),
    );
  }
}
```

This will render a button at the center of the page.

## Additional Information

- **Customizing the Button**: You can customize the button’s styles in the `lib/components/custom_button.dart` file.
- **Installing Other Components**: You can create other components like cards, inputs, etc., in a similar manner. For example, to add a card component, create a new file `lib/components/custom_card.dart` and define your card widget there.

### `lib/components/custom_card.dart`

```dart
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
```

- **Using the Card Component**: Use the `CustomCard` component in your main app.

### `lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'components/custom_button.dart';
import 'components/custom_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              child: Text('This is a custom card'),
            ),
            SizedBox(height: 20),
            CustomButton(
              label: 'Click Me',
              onPressed: () {
                print('I love the Celo Composer <3');
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

## Documentation

For more components and advanced usage, refer to the Flutter documentation:

- [Flutter Widgets](https://flutter.dev/docs/development/ui/widgets)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_hooks](https://pub.dev/packages/flutter_hooks)

By following these steps, you can create and use reusable UI components in your Flutter app, similar to how you would in a Next.js app with ShadCN.
