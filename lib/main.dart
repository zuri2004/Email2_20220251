import 'package:flutter/material.dart';

void main() => runApp(const ListTileApp());

class ListTileApp extends StatelessWidget {
  const ListTileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ListTileExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListTileExampleState createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Page1(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBebidas')),
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_currentIndex],
          ),
          const Positioned(
            top: 8.0,
            right: 16.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Utem',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildListTile(context, 'Café', 'Receta de Café', Icons.local_cafe),
          buildListTile(
              context, 'Té', 'Receta de Té', Icons.emoji_food_beverage),
          buildListTile(context, 'Agua', 'Receta de Agua', Icons.water),
        ],
      ),
    );
  }

  Widget buildListTile(
      BuildContext context, String title, String recipe, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          tileColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          leading: Icon(icon, color: Colors.teal),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          subtitle: Text(
            recipe,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward, color: Colors.teal),
          onTap: () {
            if (title == 'Café') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CafePage(),
                ),
              );
            } else if (title == 'Té') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TePage(),
                ),
              );
            } else if (title == 'Agua') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AguaPage(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Historial',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CafePage extends StatelessWidget {
  const CafePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Café'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Café',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Receta de Café:\n\nIngredientes:\n- Café molido\n- Agua caliente\n\nInstrucciones:\n1. Agrega café molido al filtro de la cafetera.\n2. Vierte agua caliente sobre el café.\n3. Espera a que se filtre y disfruta.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TePage extends StatelessWidget {
  const TePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Té'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Té',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Receta de Té:\n\nIngredientes:\n- Bolsitas de té\n- Agua caliente\n\nInstrucciones:\n1. Coloca una bolsita de té en una taza.\n2. Vierte agua caliente sobre la bolsita de té.\n3. Deja reposar y disfruta.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AguaPage extends StatelessWidget {
  const AguaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Agua'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola desde la Página de Agua',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Receta de Agua:\n\nIngredientes:\n- Agua\n\nInstrucciones:\n1. Toma un vaso.\n2. Vierte agua en el vaso.\n3. Disfruta de un vaso de agua refrescante.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
