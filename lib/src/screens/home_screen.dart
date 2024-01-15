import 'package:flutter/material.dart';
import 'package:gatubelos_app/src/models/gato_model.dart';
import 'package:gatubelos_app/src/services/gatos_service.dart';

//Pantalla de Inicio o Home de la App
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GatosService gatosService = GatosService();
  List<GatoModel> listGatos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Catbreeds'),
      ),
      body: Container(
        padding: EdgeInsets.all(3),
        child: Column(
          children: <Widget>[
            Expanded(child: crearListado(context)),
          ],
        ),
      ),
    );
  }

  //Método que permite crear el listado de Gatos a visualizar
  Widget crearListado(BuildContext context) {
    return FutureBuilder(
        future: gatosService.cargarGatos(context),
        builder:
            (BuildContext context, AsyncSnapshot<List<GatoModel>> snapshot) {
          if (snapshot.hasData) {
            listGatos = snapshot.data!;

            if (listGatos.isEmpty) {
              return Column(
                children: [
                  const SizedBox(height: 100.0),
                  Text('Sin Datos'),
                  const SizedBox(height: 100.0),
                ],
              );
            } else {
              return Column(
                children: [
                  SizedBox(height: 10),
                  //Campo de Busqueda
                  //Row(),
                  //Inicio de Lista de Gatos
                  SizedBox(height: 5),
                  Expanded(
                      child: ListView.builder(
                          itemCount: listGatos.length,
                          itemBuilder: (BuildContext context, int i) {
                            return _crearItem(context, listGatos[i]);
                          }))
                ],
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _crearItem(BuildContext context, GatoModel gato) {
    String baseUrlImg = "https://cdn2.thecatapi.com/images/";
    String nombreImagen =
        baseUrlImg + gato.referenceImageId.toString() + '.jpg';

    final colores = Theme.of(context).colorScheme;

    return Card(
      elevation: 1.0,
      clipBehavior: Clip.hardEdge,
      color: colores.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            child: Image.network(
              nombreImagen,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/img_error.jpg');
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Más'),
                  Icon(Icons.more_horiz_outlined),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      /*
      //ListTile(
        tileColor: Colors.green[50],
        title: Text('${gato.id} ${gato.name}',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            )),
        subtitle: Text(
            'País: ${gato.countryCode}\n Inteligencia: ${gato.intelligence}',
            style: TextStyle(
              color: Colors.blueGrey,
              //fontWeight: FontWeight.bold,
              fontSize: 12.0,
            )),
      ),
      */
    );
  }
}
