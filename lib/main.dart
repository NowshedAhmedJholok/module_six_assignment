import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Photo Gallery"),
        ),
        body: PhotoGalleryScreen(),
      ),
    );
  }
}

class PhotoGalleryScreen extends StatefulWidget {
  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> imageUrls = [
    "https://i.ibb.co/hRSnmQB/20210826-184755.jpg",
    "https://images.pexels.com/photos/12601624/pexels-photo-12601624.jpeg",
    "https://images.pexels.com/photos/18184356/pexels-photo-18184356/free-photo-of-south-american-coati-in-nature.jpeg",
    "https://images.pexels.com/photos/18184356/pexels-photo-18184356/free-photo-of-south-american-coati-in-nature.jpeg",
    "https://images.pexels.com/photos/12601624/pexels-photo-12601624.jpeg",
    "https://i.ibb.co/hRSnmQB/20210826-184755.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text(
          "Welcome to the Photo Flutter App",
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            labelText: "Photo Search",
            border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)
            ),
          ),
        ),
        SizedBox(height: 16.0),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {

              },
              child: Column(
                children: [
                  Image.network(imageUrls[index],
                  width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Text("Image ${index + 1}"),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 16.0),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text("Sample Photo 1"),
          subtitle: Text("Subtitle 1"),
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text("Sample Photo 2"),
          subtitle: Text("Subtitle 2"),
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text("Sample Photo 3"),
          subtitle: Text("Subtitle 3"),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Photos Uploaded Successfully!"),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }


}
