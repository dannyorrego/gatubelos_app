import 'package:flutter/material.dart';
import 'package:gatubelos_app/src/models/gato_model.dart';

class DetalleScren extends StatefulWidget {
  DetalleScren(this.gato, {Key? key}) : super(key: key);

  final GatoModel gato;

  @override
  State<DetalleScren> createState() => _DetalleScrenState();
}

class _DetalleScrenState extends State<DetalleScren> {
  @override
  Widget build(BuildContext context) {
    //final GatoModel gato = ModalRoute.of(context)?.settings.arguments as GatoModel;
    GatoModel gatoModel = widget.gato;
    String baseUrlImg = "https://cdn2.thecatapi.com/images/";
    String nombreImagen = '$baseUrlImg${gatoModel.referenceImageId}.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text(gatoModel.name),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            //Columna 1 Imagen
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
            SizedBox(
              height: 10,
            ),
            //Columna 2 Scroll de infromacion
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.description.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Weight (Metric):',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.weight!.metric.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Temperament:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.temperament.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Origin:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.origin.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Country:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.countryCode.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Life Span:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.lifeSpan.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Intelligence:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.intelligence.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Adaptability',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.adaptability.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Energy Level:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.energyLevel.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Grooming:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.grooming.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Vocalisation:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.vocalisation.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hairless:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.hairless.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Child Friendly:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.childFriendly.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Dog Friendly:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.dogFriendly.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Stranger Friendly:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(gatoModel.strangerFriendly.toString()),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
