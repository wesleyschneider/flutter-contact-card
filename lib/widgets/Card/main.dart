import 'package:contact_card/widgets/ImageProfile/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../LinkButton/main.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsetsDirectional _padding = EdgeInsetsDirectional.only(top: 10);
  final BoxDecoration _decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: _decoration,
      child: CardHeader(),
    );
  }
}

class CardHeader extends StatelessWidget {
  final EdgeInsets iconPadding = EdgeInsets.symmetric(vertical: 3.5);
  final EdgeInsets iconMargin = EdgeInsets.only(bottom: 30, top: 5);
  final BoxDecoration iconStyle = BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  final TextStyle titleTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  final TextStyle captionTextStyle = TextStyle(fontSize: 13);
  final EdgeInsetsDirectional captionContainerMargin =
      EdgeInsetsDirectional.only(top: 10);
  final EdgeInsets buttonsContainerMargin =
      EdgeInsets.symmetric(horizontal: 40, vertical: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: iconPadding,
            margin: iconMargin,
            decoration: iconStyle,
            width: 50,
          ),
          ImageProfile(),
          Text(
            'Wesley Schneider',
            style: Theme.of(context).textTheme.headline1.merge(titleTextStyle),
          ),
          Container(
            margin: captionContainerMargin,
            child: Text(
              'Software Developer at CWI',
              style:
                  Theme.of(context).textTheme.caption.merge(captionTextStyle),
            ),
          ),
          Container(
            margin: buttonsContainerMargin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LinkButton(
                  icon: Icons.phone_outlined,
                  title: 'Phone',
                  onPressed: () => UrlLauncher.launch("tel://51992906265"),
                ),
                LinkButton(
                  icon: Icons.email_outlined,
                  title: 'E-mail',
                  onPressed: () => UrlLauncher.launch(
                      "mailto:wesleyschneideraires@gmail.com"),
                ),
                LinkButton(
                  icon: Icons.message_outlined,
                  title: 'Message',
                  onPressed: () => UrlLauncher.launch("sms://51992906265"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
