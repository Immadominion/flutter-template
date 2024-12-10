import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reown_appkit/reown_appkit.dart';
import '../providers/app_provider.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Use context.read to access the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppProvider>().initializeAppKitModal(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Consumer<AppProvider>(
                builder: (context, appProvider, _) {
                  if (appProvider.appKitModal != null) {
                    return AppKitModalAccountButton(
                        appKitModal: appProvider.appKitModal!);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
