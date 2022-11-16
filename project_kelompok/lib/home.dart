import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'seachpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
void main() {
  runApp(new MaterialApp(
    title: "Currency Converter",
    home: new Home(),
    routes: {
        '/search': (context) => const Searchpage(),
      },
  ));
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     // bar navigasi
      appBar: AppBar(
        title: Text('Kito Search')
      ),

      //body
      body: Center(
        child: 
        
        //isi pada body
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                // judul halaman
                Text('Selamat Datang di Kito Search\n\n',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30)),
                
                // keterangan
                Text('Klik di bawah untuk memudai pencarian\n\n\n'),
                
                // tombol mulai
                ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/search');}, child: const Text('Mulai', style: TextStyle(fontSize: 20),))
              ],)
              
            ],
          )
        
      ),
    );
  }
}