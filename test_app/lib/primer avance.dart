import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MusicStoreApp());
}

class MusicStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Erda Harmonix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showLogin = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _showLogin = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Erda Harmonix',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _showLogin
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text('Iniciar Sesión'),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Suponiendo que el inicio de sesión es exitoso, navegamos a la página principal
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Erda Harmonix'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar la información
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InformationPage(),
                ),
              );
            },
            child: Text('1. Inicio'),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar los instrumentos
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InstrumentsPage(),
                ),
              );
            },
            child: Text('2. Instrumentos'),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar la ropa
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClothingPage(),
                ),
              );
            },
            child: Text('3. Ropa'),
          ),
        ],
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Center(
        child: Text(
          'Esta es la página de información.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class InstrumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instrumentos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _showInstrumentInfo(context, 'Guitarra',
                  'La guitarra es un instrumento de cuerda que se toca pulsando o rasgueando las cuerdas con los dedos o una púa.');
            },
            child: Text('Guitarra'),
          ),
          ElevatedButton(
            onPressed: () {
              _showInstrumentInfo(context, 'Bajo',
                  'El bajo eléctrico es un instrumento de cuerda similar a la guitarra pero con un sonido más grave, que se toca pulsando las cuerdas con los dedos o con una púa.');
            },
            child: Text('Bajo'),
          ),
          ElevatedButton(
            onPressed: () {
              _showInstrumentInfo(context, 'Teclado',
                  'El teclado es un instrumento musical que consiste en una serie de teclas que producen sonidos al ser presionadas, y es utilizado para tocar melodías y armonías.');
            },
            child: Text('Teclado'),
          ),
        ],
      ),
    );
  }

  void _showInstrumentInfo(
      BuildContext context, String instrumentName, String info) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(instrumentName),
          content: Text(info),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

class ClothingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ropa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar camisas
            },
            child: Text('Camisas'),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar hoodies
            },
            child: Text('Hoodies'),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar pantalones
            },
            child: Text('Pantalones'),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar zapatos
            },
            child: Text('Zapatos'),
          ),
        ],
      ),
    );
  }
}
