import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Chat GPT',
      home: MyHomePage(title: 'Flutter Chat GPT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setBackgroundColor(primaryColor)
      ..setNavigationDelegate(
          NavigationDelegate(
              // onNavigationRequest: (NavigationRequest request){
              //   // return NavigationDecision.prevent;
              // },
              onPageFinished: (String url){},
              onPageStarted: (String url){},
              onProgress: (int progress){}
          )
      )
      ..loadRequest(Uri.parse('https://chat.openai.com/auth/login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: WebViewWidget(
        controller: _controller,
      ),
      // body: Center(
      //   child: Image.asset(
      //     'assets/chat-gpt-logo.jpg',
      //     width: MediaQuery.of(context).size.width * 3 / 5,
      //   ),
      // ),
    );
  }
}
