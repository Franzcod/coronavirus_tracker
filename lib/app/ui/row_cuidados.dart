import 'package:flutter/material.dart';

class RowCuidados extends StatelessWidget {
  const RowCuidados({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)),
              width: 120,
              height: 135,
              //color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset('assets/icons/face-mask.png'),
                    Text('Usa barbijo')
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)),
              width: 120,
              height: 135,
              //color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset('assets/icons/fever.png'),
                    Text('Controla temp.')
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)),
              width: 120,
              height: 135,
              //color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset('assets/icons/hand-cleaning.png'),
                    Text('Lavar manos')
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)),
              width: 120,
              height: 135,
              //color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset('assets/icons/infection-people.png'),
                    Text('Distancia')
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)),
              width: 120,
              height: 135,
              //color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset('assets/icons/cough.png'),
                    Text('Toser en codo')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
