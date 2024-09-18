import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter form',
      home: const FormPage(title: 'Formulario en Flutter'),
    );
  }

}

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.title});

  final String title;

  @override
  State<FormPage> createState() => _FormPage();
}

class _FormPage extends State<FormPage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
    NavigationDestinationLabelBehavior.onlyShowSelected;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Datos personales',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Datos de contacto',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Datos académicos',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).
        colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _obtenerContenido(),
    );
  }

  Widget _obtenerContenido() {
    switch (currentPageIndex) {
      case 0:
        return _datosPersonales();
      case 1:
        return const Center(
          child: Text(
            'Datos de contacto',
            style: TextStyle(fontSize: 24),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            'Datos académicos',
            style: TextStyle(fontSize: 24),
          ),
        );
      default:
      return const Center(
        child: Text(
          'Selecciona una opción',
          style: TextStyle(fontSize: 24),
        ),
      );
    }
  }

  Widget _datosPersonales() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Paterno',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Apellido paterno'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Materno',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Apellido materno'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Nombre(s)',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar tu nombre completo'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // añadir despues
                }
              },
              child: const Text('Guardar datos personales'),
            ),
          ),
        ],
      ),
    );
  }
}