# Yggdrasil

![Yggdrasil Design System](https://via.placeholder.com/800x200?text=Yggdrasil+Design+System)

Design system developed by Futurehome for building cohesive and accessible applications.

## What is Yggdrasil?

Yggdrasil is a comprehensive design system that provides a unified set of components, patterns, and tools to build cohesive applications. It accelerates development while ensuring consistency across all products.

## Developer-Focused Approach

Yggdrasil was built with developers in mind, focusing on:

- **Simplified Implementation**: Taking away the responsibility of implementing complex widget designs and theming from developers.
- **Ready-to-Use Components**: Pre-built components that follow design guidelines out of the box.
- **Reduced Decision Fatigue**: Clear patterns and guidelines for common UI challenges.

Our goal is to let developers focus on building features rather than spending time on design implementation details. By providing a complete, well-documented component library, Yggdrasil makes development faster, more consistent, and less error-prone.

## Installation

Add Yggdrasil to your `pubspec.yaml`:

```yaml
dependencies:
  yggdrasil: ^latest_version
```

Or from the command line:

```bash
flutter pub add yggdrasil
```

## Basic Usage

### YggdrasilApp

To use Yggdrasil in your application, replace Flutter's `MaterialApp` with `YggdrasilApp`:

```dart
import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YggdrasilApp(
      title: 'My App',
      theme: YgThemes.light, // Use Yggdrasil light theme
      darkTheme: YgThemes.dark, // Use Yggdrasil dark theme
      home: MyHomePage(),
    );
  }
}
```

## Getting Started

### For Developers

1. **Setup**: Install the package as described above
2. **Theme Implementation**: Use the `YggdrasilApp` wrapper instead of Flutter's `MaterialApp`
3. **Components**: Import and use Yggdrasil components:
   ```dart
   import 'package:yggdrasil/yggdrasil.dart';
   
   // Use components
   YgButton(
     onPressed: () {},
     child: Text('Click Me'),
   )
   ```

### For Designers

Yggdrasil provides a consistent design language based on Futurehome's brand identity. Design files and guidelines are available for reference in our [Supernova documentation](https://steady-weasel-purple.supernova-docs.io/latest/get-started/welcome-CNGiUMqM).

## Features

- **Accessibility built-in**: Components follow accessibility best practices
- **Responsive components**: Works across all screen sizes
- **Consistent look and feel**: Pre-designed components maintaining brand identity
- **Custom theme support**: Easily adapt components to your specific needs

## Why Yggdrasil?

### Cohesive Product Experience

Yggdrasil ensures a consistent experience across all Futurehome products, making them intuitive and familiar to users regardless of the device or platform they're using.

### Accessibility at Scale

Futurehome applications are used by people of all skill levels and tech backgrounds. Yggdrasil implements accessibility best practices by default, allowing teams to focus on solving user problems without compromising on inclusion.

### Development Efficiency

Reusable components reduce development time and ensure consistent implementation across products.

## Contributing

Guidelines for contributing to Yggdrasil will be available soon.

## License

[License information]
