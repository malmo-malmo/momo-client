import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('메인페이지'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('활성화'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('비활성화'),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '힌트텍스트',
              ),
            )
          ],
        ),
      ),
    );
  }
}
