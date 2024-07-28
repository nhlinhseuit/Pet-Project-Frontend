import 'package:flutter/material.dart';
import 'package:pet_project_frontend/fetch.dart';
import 'package:pet_project_frontend/services/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name here',
              ),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                hintText: 'Price here',
              ),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                hintText: 'Description here',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                var data = {
                  'pname': nameController.text,
                  'pprice': priceController.text,
                  'pdesc': descController.text,
                };
                Api.addProduct(data);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FetchData()),
                );
              },
              child: const Text('Create data'),
            ),
          ],
        ),
      ),
    );
  }
}
