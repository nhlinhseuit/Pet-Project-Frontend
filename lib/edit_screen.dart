import 'package:flutter/material.dart';
import 'package:pet_project_frontend/model/product_model.dart';
import 'package:pet_project_frontend/services/api.dart';
import 'package:pet_project_frontend/update.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.data.name!;
    priceController.text = widget.data.price!;
    descController.text = widget.data.desc!;
    super.initState();
  }

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
              decoration: InputDecoration(
                hintText: widget.data.name,
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: widget.data.price,
              ),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                hintText: widget.data.desc,
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
                  'id': widget.data.id,
                };
                Api.updateProduct(widget.data.id, data);
                // Navigator.pop(context);
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const UpdateData()),
                // );
              },
              child: const Text('Update data'),
            ),
          ],
        ),
      ),
    );
  }
}
