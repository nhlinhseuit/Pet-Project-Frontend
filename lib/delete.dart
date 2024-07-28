import 'package:flutter/material.dart';
import 'package:pet_project_frontend/model/product_model.dart';
import 'package:pet_project_frontend/services/api.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          future: Api.getProduct(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Product> pdata = snapshot.data!;
              return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text('${pdata[index].name}'),
                    subtitle: Text('${pdata[index].desc}'),
                    trailing: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Api.deleteProduct(pdata[index].id);
                      pdata.removeAt(index);
                      setState(() {});
                    },
                  );
                },
              );
            }
          },
        ));
  }
}
