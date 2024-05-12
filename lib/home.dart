import 'package:databases_sqflite/Ubah_Mahasiswa.dart';
import 'package:flutter/material.dart';
import 'mahasiswa_model.dart';
import 'DatabaseHelper.dart';
import 'input_mahasiswa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? selectedId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Data Mahasiswa'),
      ),
      body: FutureBuilder<List<MahasiswaModel>>(
        future: DatabaseHelper.instance.getAllMahasiswa(),
        builder: (BuildContext context,
            AsyncSnapshot<List<MahasiswaModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Loading....'),
            );
          }
          return (snapshot.data != null && snapshot.data!.isEmpty)
              ? const Center(child: Text('No Data in List. '))
              : ListView(
                  children: snapshot.data!.map((mahasiswa) {
                    return Center(
                      child: Card(
                        color: Colors.white70,
                        child: ListTile(
                          title: Text(mahasiswa.nama),
                          onTap: () {
                            setState(
                              () {
                                if (selectedId == null) {
                                  selectedId = mahasiswa.id;
                                } else {
                                  selectedId = null;
                                }
                              },
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UbahMahasiswa(
                                          key: UniqueKey(),
                                          id: mahasiswa.id ?? 0,
                                          nama: mahasiswa.nama,
                                          jenjang: mahasiswa.jenjang,
                                          prodi: mahasiswa.prodi,
                                        )));
                          },
                          trailing: InkWell(
                            child: const Icon(
                              Icons.delete_forever_rounded,
                              size: 30,
                              color: Colors.red,
                            ),
                            onTap: () {
                              setState(() {
                                DatabaseHelper.instance
                                    .remove(mahasiswa.id ?? 0);
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InputMahasiswa()),
          );
        }, // atau () {} untuk fungsi kosong
      ),
    );
  }
}
