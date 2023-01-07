import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminReportView extends ConsumerStatefulWidget {
  const AdminReportView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminReportViewState();
}

class _AdminReportViewState extends ConsumerState<AdminReportView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Admin Report View'),
      ),
    );
  }
}
