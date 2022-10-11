import 'package:flutter/material.dart';

class MensajeFlashScreen extends StatelessWidget {
  const MensajeFlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        AlertDialog(
          title: Text('Mensaje'),
          content: Text('Esta es una alerta'),
          actions: [
            TextButton(
                onPressed: () {
                  print("no");
                  Navigator.pop(context);
                },
                child: Text('No')),
          ],
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              padding: EdgeInsets.all(16),
              height: 90,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Oh snap!",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "Flutter pe causa",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      },
      child: Text("data"),
    )));
  }
}
