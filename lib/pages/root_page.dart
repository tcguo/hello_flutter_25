import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'discover_page.dart';
import 'firend_page.dart';
import 'mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _current_index = 0;
  List<Widget> _pages = [ChatPage(), FriendPage(), DiscoverPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pages[_current_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _current_index,
          fixedColor: Colors.green,
          onTap: (index) {
            setState(() {
              _current_index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "聊天"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "朋友"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "发现"),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: "我的"),
          ],
        ),
      ),
    );
  }
}
