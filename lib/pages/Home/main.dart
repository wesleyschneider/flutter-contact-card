import 'package:contact_card/widgets/Card/main.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Image.asset(
            'images/background.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 0.389,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: CardWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}
