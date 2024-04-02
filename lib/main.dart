import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const WebViewDemo(),
    );
  }
}


class WebViewDemo extends StatefulWidget {
 const WebViewDemo({super.key});

 @override
 State<WebViewDemo> createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
 WebViewController controller = WebViewController();

@override
void initState(){
super.initState();
 controller
 ..setJavaScriptMode(JavaScriptMode.unrestricted)
 ..setBackgroundColor(const Color(0x000000))
 ..setNavigationDelegate(NavigationDelegate(
 onProgress: (progress) => {},
 onPageFinished: (url) => {},
 ))
 ..loadRequest(Uri.parse('http://localhost:8080/login'));
}

 @override
 Widget build(BuildContext context) {
 return Scaffold(
backgroundColor: Colors.white,
 appBar: AppBar(
 title: const Text('demo'),
 ),
       body: WebViewWidget(controller: controller,),
 );
}
}
