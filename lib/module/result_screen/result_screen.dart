import 'package:flutter/material.dart';
import 'package:task11/shared/componant/componants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [customIcon(Image: 'assets/images/Group 9.jpg')]),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Scanning Result',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Proreader will Keep your last 10 days history to keep your all scared history please purched our pro package',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          customIcon(Image: 'assets/images/result_icon.jpg'),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            '7E0918FF',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          )
                        ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: 5),
            ),
            Container(
              height: 60,
              width: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepOrangeAccent,
              ),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    // saveResult();
                  },
                  child: Text(
                    'Send',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
