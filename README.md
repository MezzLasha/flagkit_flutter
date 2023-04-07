
Flag Kit
========

Flag Kit is a Flutter package that provides a simple way to display a flag for a specific country using its [ISO 3166-1 alpha-2 code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).

Usage
-----

To use Flag Kit, simply add it to your project's `pubspec.yaml` file:


    flag_kit: ^0.0.1

Then, in your Dart code, import the `flag_kit` package:

    import 'package:flag_kit/flag_kit.dart';

Finally, use the `Flag` widget to display a flag:

     Widget build(BuildContext context) {
       return Flag.of('GE'); //in this case Georgian flag
     }

By default, the `Flag` widget will size itself to fit its parent widget. If you want to specify a size for the flag, you can do so using the `size` parameter:


    Flag('US', size: 48)

Features
--------

*   Displays flags for all countries with a valid ISO 3166-1 alpha-2 code
*   Simple and easy-to-use API

Goals
--------

*   Option to have SVG Flags for perfect scaling

Contributing
------------
Big Thanks to [FlagKit](https://github.com/madebybowtie/FlagKit).

We welcome contributions to Flag Kit! To get started, please read our [contribution guidelines](CONTRIBUTING.md).

License
-------

Flag Kit is released under the MIT License.

