import 'package:flutter/material.dart';
import 'package:project_kelompok/main.dart';

void main() {
runApp(const Searchpage());
}

class Searchpage extends StatelessWidget {
const Searchpage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return MaterialApp(
    debugShowCheckedModeBanner: false,
	title: 'Kito search aplication',
	theme: ThemeData(
		primarySwatch: Colors.blue,
	),

  // class yang di tampilkan
	home: GFG(),
	);
}
}


class GFG extends StatefulWidget {
const GFG({Key? key}) : super(key: key);

@override
State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
@override
Widget build(BuildContext context) {
	return Scaffold(

    // bar navigasi
	appBar: AppBar(
		title: const Text(
		"Kito Search",
		),
		
	),
  body: Center(
    
    child: Container(
      decoration: BoxDecoration(),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Mulai pencarian\n\n', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
    
			onPressed: () {
			
      // menampilkan bidang pencarian
			showSearch(
				context: context,
				delegate: CustomSearchDelegate()
			);
			},
			child:  Icon(Icons.search,),
		),
            ],
          )
        ],
      )
      

  )
  
	));
}
}


class CustomSearchDelegate extends SearchDelegate {

// contoh hitory pencarian bawaan aplikasi saat di download
List<String> searchTerms = [
	"Valorant",
	"Steam",
	"Game of Schools",
	"KKN Desa Penari",
];
	
// tombol untuk membersihkan dan search ketikan saat mencari( icon  x pada pojok kanan)
@override
List<Widget>? buildActions(BuildContext context) {
	return [
    Container(
      child: Row(
        children: [

          // tombol clear ( tanda x ) pada search bar
          IconButton(
	        	onPressed: () {
              query = '';
		        },
		        icon: Icon(Icons.clear),
	        ),

          // tombol search untuk mencari
          IconButton(
		        onPressed: () {
        
        		},
		        icon: Icon(Icons.search),
	        ),
        ],
      )
    ),
	];
}

// tombol kembali pada search bar
@override
Widget? buildLeading(BuildContext context) {
	return IconButton(
	onPressed: () {
		close(context, null);
	},
	icon: Icon(Icons.arrow_back),
	);
}

// untuk menampilkan hasil ketikan pada serach bar yang  sesuai dengan history yang ada
@override
Widget buildResults(BuildContext context) {
	List<String> matchQuery = [];
  
  //deklarasi bahwa variable fruit yaitu yang di ketikan pada search bar terdaapat pada history(searchTerms)
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}


@override
Widget buildSuggestions(BuildContext context) {
	List<String> matchQuery = [];
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}
}
