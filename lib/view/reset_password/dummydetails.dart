import '../../allpackages.dart';

class DummyDetails extends StatefulWidget {
  const DummyDetails({Key? key}) : super(key: key);

  @override
  _DummyDetailsState createState() => _DummyDetailsState();
}

class _DummyDetailsState extends State<DummyDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Center(
          child: Image.asset(
            'assets/images/LOGO.png',
            height: 50.0.w,
            width: 200.0.w,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          'CHANGE PASSWORD',
          textAlign: TextAlign.center,
          style: toptitleStyle,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''Set the new password for your account so you can login and access all the features.''',
                    textAlign: TextAlign.justify,
                    style: formhintstylesearch,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
