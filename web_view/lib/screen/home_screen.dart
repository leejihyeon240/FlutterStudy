import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  // WebViewController? controller;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true, // 안드로이드와 ios의 디폴트 위치가 다른 것을 가운데로 같도록 설정
        actions: [
          IconButton ( // 아이콘을 버튼으로 만들어 줌
            onPressed: () {
              // http://
              // https:// --> 보안이 조금 더 좋음
              // if(controller == null){ // 만약에 null이면, 아무것도 하지않고 그냥 return
              //   return;
              // }
              //
              // controller!.loadUrl(homeUrl); // null이 아니라면, 홈으로 이동
              // !를 달아줘서, 절대로 null이 될 수 없음을 알려줌

              controller.loadRequest(homeUrl);
            },
            icon: Icon(
              Icons.home,
            ),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      // WebView(
      //   onWebViewCreated: (WebViewController controller) {
      //     this.controller = controller; // 컨트롤러를 사용해서 조정할 수 있음
      //   },
      //   initialUrl: homeUrl,
      //   javascriptMode: JavascriptMode.unrestricted,
      // ),
    );
  }
}
