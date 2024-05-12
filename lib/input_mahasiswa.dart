import 'home.dart';

import 'package:flutter/material.dart';

import 'mahasiswa_model.dart';

import 'databasehelper.dart';

class InputMahasiswa extends StatefulWidget {
  const InputMahasiswa({super.key});

  @override
  State<InputMahasiswa> createState() => _InputMahasiswaState();
}

class _InputMahasiswaState extends State<InputMahasiswa> {
  late int selectedId;

  final TextEditingController namaController = TextEditingController();
  final TextEditingController jenjangController = TextEditingController();
  final TextEditingController prodiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database SQLite"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                ),
              ),
              TextFormField(
                controller: jenjangController,
                decoration: const InputDecoration(
                  labelText: "Jenjang",
                ),
              ),
              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                  labelText: "Prodi",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await DatabaseHelper.instance.add(
                      MahasiswaModel(
                        nama: namaController.text,
                        jenjang: jenjangController.text,
                        prodi: prodiController.text,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                    );
                  } catch (e) {
                    print("Error while saving data: $e");
                    // Optionally, show a snackbar or dialog to inform the user about the error.
                  }
                },
                child: Text('Simpan'),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
