import 'package:flutter/material.dart';
import 'package:pet_project_frontend/edit_screen.dart';
import 'package:pet_project_frontend/model/product_model.dart';
import 'package:pet_project_frontend/services/api.dart';

class UpdateData extends StatelessWidget {
  const UpdateData({super.key});

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
                    trailing: const Icon(Icons.edit),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditScreen(
                                  data: pdata[index],
                                )),
                      );
                    },
                  );
                },
              );
            }
          },
        ));
  }
}
