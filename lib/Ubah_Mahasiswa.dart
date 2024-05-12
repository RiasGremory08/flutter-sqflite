import 'home.dart';

import 'package:flutter/material.dart';

import 'mahasiswa_model.dart';

import 'databasehelper.dart';

class UbahMahasiswa extends StatefulWidget {
  const UbahMahasiswa({
    required Key key,
    required this.id,
    required this.nama,
    required this.jenjang,
    required this.prodi,
  }) : super(key: key);

  final int id;
  final String nama;
  final String jenjang;
  final String prodi;

  @override
  State<UbahMahasiswa> createState() => _UbahMahasiswaState();
}

class _UbahMahasiswaState extends State<UbahMahasiswa> {
  @override
  void initState() {
    super.initState();
    namaController.text = widget.nama;
    jenjangController.text = widget.jenjang;
    prodiController.text = widget.prodi;
  }

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
                    await DatabaseHelper.instance.update(
                      MahasiswaModel(
                        id : widget.id,
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
                child: Text('Ubah'),
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
