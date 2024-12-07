import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';

class AppProvider with ChangeNotifier {
  ReownAppKitModal? _appKitModal;
  bool _isConnected = false;
  String _userAddress = '';

  ReownAppKitModal? get appKitModal => _appKitModal;
  bool get isConnected => _isConnected;
  String get userAddress => _userAddress;

  Future<void> initializeAppKitModal(BuildContext context) async {
    _appKitModal = ReownAppKitModal(
      context: context,
      projectId: '044601f65212332475a09bc14ceb3c34',
      metadata: const PairingMetadata(
        name: 'Celo Composer',
        description: 'Memecoin trading made easy',
        url: 'https://celo-composer.com/',
        icons: ['assets/images/logo.png'],
      ),
    );

    await _appKitModal?.init();

    // Add listener
    _appKitModal?.addListener(_updateState);
    _updateState();
  }

  void _updateState() {
    final wasConnected = _isConnected;
    _isConnected = _appKitModal?.isConnected ?? false;
    _userAddress = _appKitModal?.session?.getAddress('') ?? '';

    // Only notify listeners if the connection state has changed
    if (wasConnected != _isConnected) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _appKitModal?.removeListener(_updateState);
    super.dispose();
  }
}