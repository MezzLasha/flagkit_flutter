import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  /// Returns the flag of the country specified by [country].
  ///
  /// [country] should be a two-letter country code, as defined by ISO 3166-1 alpha-2.
  ///
  ///
  /// {@tool snippet}
  /// This example shows how to use the [of] method to add a flag to a widget.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Row(
  ///     mainAxisAlignment: MainAxisAlignment.center,
  ///     children: [
  ///       Text('Hello from'),
  ///       Flag.of('GE'),
  ///     ],
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  static Widget of(String country) {
    return Flag(
      country.toUpperCase(),
      size: 32,
    );
  }

  /// A widget that displays a flag with a specific [country] code. If the [country] code does not exist, with default [errorBuilder] it will display a default "WW" flag.
  ///
  /// [country] should be a two-letter country code, as defined by ISO 3166-1 alpha-2.
  /// If [size] is not specified, it will default to [32.0].
  ///
  ///
  /// {@tool snippet}
  /// This example shows how to use the [of] method to add a flag to a widget.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Row(
  ///     mainAxisAlignment: MainAxisAlignment.center,
  ///     children: [
  ///       Text('Hello from'),
  ///       Flag('GE', size: 48),
  ///     ],
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  ///
  const Flag(this.country,
      {super.key, this.size, this.frameBuilder, this.errorBuilder});

  /// The country code to display.
  final String country;

  /// The width and height of the flag.
  final double? size;

  /// The builder to use if an error occurs while loading the flag.
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  /// The builder to use when creating the widget tree.
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/flags/${country.toUpperCase()}@3x.png'),
      width: size ?? 32,
      height: size ?? 32,
      fit: BoxFit.contain,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder ??
          (context, error, stackTrace) {
            // error out
            if (kDebugMode) {
              print('FlagKitError: loading flag for country: $country');
            }

            // If the flag does not exist, return the WW flag.
            return Image(
              image: const AssetImage(
                'assets/flags/WW@3x.png',
              ),
              width: size ?? 32,
              height: size ?? 32,
              fit: BoxFit.contain,
            );
          },
    );
  }
}
