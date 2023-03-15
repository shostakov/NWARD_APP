import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

main() {
  runApp(const ProviderScope(child: App()));
}

final currentIndexProvider = StateProvider(((ref) => 0));
final isAdminProvider = StateProvider((ref) => false);
final apptIdProvider = StateProvider<String?>((ref) => null);
