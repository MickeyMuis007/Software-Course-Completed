import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
          backgroundColor: Colors.indigo[100],
          appBar: AppBar(
            title: Text('ListView'),
          ),
          body: Home()),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
   
    return Container(
        // width: sizeX / 2,
        // height: sizeY * 0.4,
      child: GridView.count( 
        crossAxisCount: 2,
        children: createGallery(50),
        scrollDirection: Axis.vertical, 
        mainAxisSpacing: 5.0,  
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5),
        
    ));
  }
}


List<Widget> createGallery(int numImages) {
  List<Widget> images = List<Widget>();
  List<String> urls = List<String>();
  int i=0;
  urls.add('https://www.freeimages.com/download/file/eab0a25d3e94455595c071a487dc7303/639x384');
  urls.add('https://www.freeimages.com/download/file/52691d2b1d74adac031cd68e5f1e918a/640x480');
  urls.add('https://www.freeimages.com/download/file/e72dd4cbef065e77340cc9aa3f1d1445/640x480');
  urls.add('https://www.freeimages.com/download/file/6f9d6d48d1dab8897d4ecab8058da3d9/639x568');
  urls.add('https://www.freeimages.com/download/file/29c7e5921155be45a7a59e2d622dc32b/640x480');
  Widget carImage;
  while (i<numImages) {
    carImage = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(urls[i%5]),   
      ),
      ));
    images.add(carImage);
    i++;
  }
  return images;
}

List<Contact> buildContacts() {
  List<Contact> contacts = List<Contact>();
  contacts.add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
  contacts.add(Contact('Frank Slade', 'Scent of a Woman', Icons.sentiment_satisfied));
  contacts.add(Contact('Mildred Hayes', 'Three Billboards Outside Ebbing, Missouri', Icons.sentiment_dissatisfied));
  contacts.add(Contact('Bruce Wayne', 'The Dark Night', Icons.sentiment_neutral));
  contacts.add(Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_satisfied));
  return contacts;
}

List<ListTile> showContacts() {
  List<Contact> contacts = buildContacts();
  for (int i = 0; i<20; i++) {
    contacts.addAll(buildContacts());
  }
  List<ListTile> list = List<ListTile>();
  contacts.forEach((contact) {
    list.add( ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.subtitle),
      leading: CircleAvatar(child: Icon(contact.icon),
        backgroundColor: Colors.amber[600],),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => true,
      ));
    
    });
    return list;
}

List<Widget> showPizzaLayout(double sizeX, double sizeY) {
  List<Widget> layoutChildren = List<Widget>();
  Container background = Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://www.freeimages.com/download/file/e85a8ef612fd17400dd35b401a3a1a87/1600x1200'),
            fit: BoxFit.fitHeight)),
  );
  layoutChildren.add(background);
  Positioned pizzaCard = Positioned(
      top: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: Card(
        elevation: 12,
        color: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Text(
            'Margherita Pizza',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange[800]),
          ),
          Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'This delicious pizza is made of Tomato, Mozzarella and Basil. \n\nSerioulsly, you can\'t miss it!',
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              )),
        ]),
      ));
  layoutChildren.add(pizzaCard);
  Positioned buttonOrder = Positioned(
    bottom: sizeY / 20,
    left: sizeX / 20,
    width: sizeX - sizeX / 10,
    child: RaisedButton(
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.orange[900],
      child: Text(
        'Order Now!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () {},
    ),
  );
  layoutChildren.add(buttonOrder);
  return layoutChildren;
}

List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = List<Widget>();
  //squares.add(Container(color: Colors.black,));
  Widget square;
  while (i < numSquares) {
    square = Container(
      color: colors[i % 5],
      height: 100,
      width: 200,
      child: Text(i.toString()),
    );
    i++;
    squares.add(square);
  }

  return squares;
}

Widget createSquare(int position) {
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];

  Widget square = Container(
    color: colors[position % 5],
    height: 100,
    width: 100,
    child: Text(position.toString()),
  );
  return square;
}

Widget createSeparator(int position) {
  Widget square = Container(
    height: 15,
    color: Colors.black,
    child: Text('Separator ' + position.toString()),
  );
  return square;
}

class Contact {
  String name;
  String subtitle;
  IconData icon;
  Contact(this.name, this.subtitle, this.icon);
}