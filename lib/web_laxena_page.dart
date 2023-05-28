import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebLaxenaPage extends StatefulWidget {
  const WebLaxenaPage({Key? key}) : super(key: key);

  @override
  State<WebLaxenaPage> createState() => _WebLaxenaPageState();
}

class _WebLaxenaPageState extends State<WebLaxenaPage> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
            await launchUrl(Uri.parse(request.url),
                mode: LaunchMode.externalApplication);
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.laxena.com/'));
  }

  _launchURL(String url) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset(
            'assets/logo-laxena.png',
            width: 90,
            height: 100,
          ),
          actions: const [],
        ),
        body: WebViewWidget(controller: _controller!));
  }
}
