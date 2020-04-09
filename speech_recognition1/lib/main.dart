import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

void main() => runApp(Practical12());

const languages = const [
  const Language('English', 'en_US'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class Practical12 extends StatefulWidget {
  @override
  _Practical12State createState() => _Practical12State();
}

class _Practical12State extends State<Practical12> {

  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  //String _currentLocale = 'en_US';
  Language selectedLang = languages.first;

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('17it131_Practical-12'),
        
        ),
        body: new Padding(
            padding: new EdgeInsets.all(15.0),
            child: new Center(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new Expanded(
                      child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.blueGrey,
                    child: Center(
                        child: new Text(transcription,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center)),
                  )),
                  _buildButton(
                    onPressed: _speechRecognitionAvailable && !_isListening
                        ? () => start()
                        : null,
                    label:
                        _isListening ? 'Listening...' : 'TaP HeRe & SpEaK',
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildButton({String label, VoidCallback onPressed}) => new Padding(
      padding: new EdgeInsets.only(top: 8, bottom: 2, left: 40, right: 40),
      child: new RaisedButton(
        color: Colors.blueAccent,
        onPressed: onPressed,
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.mic_none,
              size: 50.0,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ],
        ),
      ));

  void start() => _speech
      .listen(locale: selectedLang.code)
      .then((result) => print('_MyAppState.start => result $result'));

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    setState(
        () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() => transcription = text);

  void onRecognitionComplete() => setState(() => _isListening = false);

}

