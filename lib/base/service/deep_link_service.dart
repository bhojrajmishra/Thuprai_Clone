import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.router.dart';

class DeepLinkService {
  DeepLinkService({
    required NavigationService navigationService,
    AppLinks? appLinks,
  })  : _navigationService = navigationService,
        _appLinks = appLinks ?? AppLinks();

  final NavigationService _navigationService;
  final AppLinks _appLinks;
  void initializeDeepLinks() {
    // Listen for deep links when app is running
    _appLinks.uriLinkStream.listen(
      (uri) {
        debugPrint('Received deep link: $uri');
        _handleDeepLink(uri);
      },
      onError: (err) {
        debugPrint('Deep link error: $err');
      },
    );

    // Check for initial deep link when app starts
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        debugPrint('Initial deep link: $uri');
        _handleDeepLink(uri);
      }
    });
  }

  void _handleDeepLink(Uri uri) {
    debugPrint('Handling deep link: $uri');

    if (uri.host == 'thuprai.com' && uri.path.startsWith('/book/')) {
      // Extract book slug from the path
      final slug = uri.path.split('/').last;
      debugPrint('Extracted slug: $slug');

      // Navigate to detail view
      _navigationService.navigateToDetailView(slug: slug);
    } else {
      debugPrint('Unrecognized deep link: $uri');
    }
  }
}
