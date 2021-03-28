import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Card',
      home: ContactCard(),
    );
  }
}

class ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/background.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          fit: BoxFit.cover,
        ),
        Expanded(
          flex: 1,
          child: Card(),
        ),
        ImageProfile(),
      ],
    );
  }
}

class Card extends StatelessWidget {
  final EdgeInsetsDirectional _margin = EdgeInsetsDirectional.only(top: 250);
  final EdgeInsetsDirectional _padding = EdgeInsetsDirectional.only(top: 60);
  final BoxDecoration _decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
    boxShadow: [
      BoxShadow(blurRadius: 100),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      padding: _padding,
      decoration: _decoration,
      child: CardHeader(),
    );
  }
}

class CardHeader extends StatelessWidget {
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

class ImageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsetsDirectional.only(top: 200),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              'images/profile.jpeg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class LinkButton extends StatelessWidget {
  LinkButton({
    @required this.icon,
    @required this.title,
    @required this.onPressed,
  });

  final ButtonStyle buttonStyle = ButtonStyle(
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange[50]),
  );
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.orange,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .button
                .merge(TextStyle(color: Colors.orange)),
          )
        ],
      ),
      onPressed: onPressed,
    );
  }
}
