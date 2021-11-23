import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:path/path.dart' as p;
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  FlutterSoundPlayer myPlayer = FlutterSoundPlayer();

  //final fileUri='https://firebasestorage.googleapis.com/v0/b/cloud2-f6bda.appspot.com/o/music%2Fa1.mp3?alt=media&token=437bc1e0-2447-4e11-ae38-5c6684ba090f';
  //final fileUri = "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3";
  //final fileUri="https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3";
  //final fileUri="https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_5MG.mp3";
  /* final fileUri =
      'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3';*/

  /*Duration d = await myPlayer.startPlayer
  (
  fromURI: fileUri,
  codec: Codec.mp3,
  whenFinished: ()
  {
  print( 'I hope you enjoyed listening to this song' );
  },
  );
*/
  pathC(){
    //print('Current path style: ${p.style}');

    //print('Current process path: ${p.current}');
    //print(p.windows.basename('C:\\talip\\music\\a1.mp3'));  //   a1.mp3
    //print(p.windows.dirname('C:\\talip\\music\\a1.mp3'));  //    C:\talip\music
    var path35=p.windows.join('C:\\talip\\music\\a1.mp3');
    print(path35);
    /*print('Separators');
    for (var entry in [p.posix, p.windows, p.url]) {
      print('  ${entry.style.toString().padRight(7)}: ${entry.separator}');
    }*/
  }

  pathDir() async {
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    print(tempPath);
    final fileUri='$tempPath/Kalimba.mp3';
  }

  uri35() async {
    //final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json'));
    //final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/images/cats/cat-6.jpg'));
    //var response = await http.get(Uri.parse('https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3'));
    //var response = await http.get(Uri.parse('https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3'));
    var response = await http.get(Uri.parse('https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.mp3'));
    print('Response body: ${response.bodyBytes}');
    print(response.bodyBytes.length);
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    var file = File('$tempPath/44100hz.mp3');
    var filePath=file.path;
    file.writeAsBytesSync(response.bodyBytes);
    print('$filePath kaydedildi.');
  }

  pathCopy() async {
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    var file = File('$tempPath/deneme1.mp3');
    var path35=p.windows.join('C:\\talip\\music\\a1.mp3');
    var filepath35=File(path35);
    //filepath35.openSync();
    var file35utf8=filepath35.readAsBytesSync();
    var baseNameWithExtension = p.basename(path35);
    print(filepath35);
    //filepath35.copy('$tempPath/deneme1.mp3');
    //var file =  await moveFile(sourceFile,newPath+"/"+basNameWithExtension);
    // Directory? tempDir = await getExternalStorageDirectory();
    // String tempPath = tempDir!.path;
    // var file = File('$tempPath/deneme2.mp3');
    // var filePath=file.path;
    // //file.createSync();
    // filepath35.copySync(filePath);
    // print('$filePath kaydedildi.');
  }

  uri55() async {
    //final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json'));
    //final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/images/cats/cat-6.jpg'));
    //var response = await http.get(Uri.parse('https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3'));
    var response = await http.get(Uri.parse(
        'http://techslides.com/demos/sample-videos/small.mp4'));
    print('Response body: ${response.bodyBytes}');
    print(response.bodyBytes.length);
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    var file = File('$tempPath/small.mp4');
    file.writeAsBytesSync(response.bodyBytes);
    print('Dosya kaydedildi.');
  }

  @override
  void initState() {
    super.initState();
    //uri35();
    //pathDir();
    // Be careful : openAudioSession return a Future.
    // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
    /*myPlayer.openAudioSession().then((value) {
      //print(value!.);
      setState(() {
        //myPlayerIsInited=true;
      });
    });
   play();*/
  }

  @override
  void dispose() {
    // Be careful : you must `close` the audio session when you have finished with it.
    myPlayer.closeAudioSession();
    //myPlayer = null;
    super.dispose();
  }

  void play() async {
    var path35=p.windows.join('C:\\talip\\music\\a1.mp3');
    //print(path35);
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    //String path35 = '${tempPath}/Kalimba.mp3';
    //String path35 = '${tempPath}/44100hz.mp3';
    //String path35 = '/storage/emulated/0/Android/data/com.example.url_sound/files/Kalimba.mp3';
    //String path35 = 'C:\talip\music\a1.mp3';
    await myPlayer.setVolume(0.9);
    await myPlayer.startPlayer(
        fromURI: path35,
        // fromURI:'file:///storage/emulated/0/Android/data/com.example.url_sound/files/deneme1.mp3',
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {
            print('şarkı bitti');
          });
        });
    setState(() {});
  }

  void play1() async {
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    String path35 = '${tempPath}/Kalimba.mp3';
    await myPlayer.setVolume(0.9);
    //await myPlayer.startPlayer( fromURI: path35, codec: Codec.mp3 );
    await myPlayer.startPlayer(
        fromURI: path35,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {
            print('şarkı bitti');
          });
        });
    setState(() {});
  }

  Future<void> pause() async {
    await myPlayer.pausePlayer();
  }

  Future<void> stopPlayer() async {
    if (myPlayer != null) {
      await myPlayer.stopPlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  play();
                  print('Play Sound');
                },
                child: Text('Play Sound')),
            ElevatedButton(
                onPressed: () {
                  pause();
                  print('Pause Sound');
                },
                child: Text('Pause Sound')),
            ElevatedButton(
                onPressed: () {
                  stopPlayer();
                  print('Stop Sound');
                },
                child: Text('Stop Sound')),
            ElevatedButton(
                onPressed: () {
                  pathC();
                  print('pathC');
                },
                child: Text('pathC')),
            ElevatedButton(
                onPressed: () {
                  pathCopy();
                  print('pathCopy');
                },
                child: Text('pathCopy')),
          ],
        ),
      ),
    );
  }
}
