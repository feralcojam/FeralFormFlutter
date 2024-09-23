import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Selecciona una opción',
  'Femenino',
  'Masculino'
  ];

const List<String> list2 = <String>[
  'Selecciona una opción',
  'Casado(a)',
  'Soltero(a)',
  'Divorciado(a)',
  'Viudo(a)'
  ];

const List<String> list3 = <String>[
  'Selecciona una opción',
  'Activo',
  'Inactivo'
  ];

const List<String> list4 = <String>[
  'Selecciona una opción',
  'Mante',
  'Tampico'
  ];

const List<String> list5 = <String>[
  'Selecciona una opción',
  'Loc1',
  'Loc2'
  ];

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
      home: FormPage(title: 'Formulario en Flutter'),
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
  String dropdownValue = list.first;
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
        return _datosContacto();
      case 2:
        return _datosAcademicos();
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
          const Text(
            'Sexo',
          ),
          DropdownMenu(
            initialSelection: list.first,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          ),
          const Text(
            'Fecha de nacimiento'
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'DD/MM/YYYY'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'CURP'
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresa tu CURP'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Estado civil',
          ),
          DropdownMenu(
            initialSelection: list2.first,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: list2.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          ),
          const Text(
            'Discapacidad'
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresa tu discapacidad'
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

  Widget _datosContacto() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Estado',
          ),
           DropdownMenu(
            initialSelection: list3.first,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: list3.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          ),
          const Text(
            'Municipio',
          ),
           DropdownMenu(
            initialSelection: list4.first,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: list4.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          ),
          const Text(
            'Tipo localidad',
          ),
           DropdownMenu(
            initialSelection: list5.first,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: list5.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          ),
          const Text(
            'Localidad',
          ),
           DropdownMenu(
            initialSelection: list5.first,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: list5.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          ),
          const Text(
            'Calle',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar tu calle'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'No° Exterior',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar tu número exterior'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'No° Interior',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar tu número interior'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Teléfono',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar tu número de teléfono'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Código postal',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar el código postal'
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
              child: const Text('Guardar datos de contacto'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _datosAcademicos() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Matrícula',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresa tu matrícula'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Carrera',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresa el nombre de tu carrera'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Especialidad',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar el nombre de tu especialidad'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Estatus',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresar tu estatus'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Tutor'
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresa el nombre de tu tutor'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Plan de estudios'
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresa tu plan de estudios'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'borrame despues';
              }
              return null;
            },
          ),
          const Text(
            'Contraseña'
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ingresa tu contraseña'
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
              child: const Text('Guardar datos académicos'),
            ),
          ),
        ],
      ),
    );
  }
}