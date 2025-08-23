import 'package:flutter/material.dart';
import 'package:news_app_example/model/artical_model.dart';
import 'package:news_app_example/service/news_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int indexOfPage = 0;
List<Widget> pages = [NewsPage(), BookMarkPage(), Scaffold()];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[indexOfPage],
        bottomNavigationBar: NavigationBar(
          selectedIndex: indexOfPage,
          onDestinationSelected: (value) {
            indexOfPage = value;
            setState(() {});
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.explore_rounded),
              label: "News",
            ),

            NavigationDestination(
              icon: Icon(Icons.bookmark),
              label: "Bookmark",
            ),
            NavigationDestination(
              icon: Icon(Icons.precision_manufacturing),
              label: "Nothing",
            ),
          ],
        ),
      ),
    );
  }
}

// bcf964f73b2644ec99b698e8d4282d25
class NewsPage extends StatefulWidget {
  NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  TextEditingController title = TextEditingController(text: 'Apple');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: NewsService().getNews(title.text),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsPageDetails(artical: snapshot.data![index]),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.network(
                                snapshot.data![index].urlToImage,
                                errorBuilder: (context, error, stackTrace) =>
                                    FlutterLogo(),
                                // headers: {"apikey":"bcf964f73b2644ec99b698e8d4282d25"}
                              ).image,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            snapshot.data![index].title.substring(0, 10),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: LinearProgressIndicator());
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => BookMarkPage()),
      //     );
      //   },
      // ),
    );
  }
}

List<ArticalModel> articalBookmark = [];

class NewsPageDetails extends StatefulWidget {
  NewsPageDetails({super.key, required this.artical});
  ArticalModel artical;

  @override
  State<NewsPageDetails> createState() => _NewsPageDetailsState();
}

class _NewsPageDetailsState extends State<NewsPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(widget.artical.urlToImage),
          ListTile(
            title: Text(widget.artical.title),
            trailing: IconButton(
              onPressed: () {
                if (!articalBookmark.contains(widget.artical)) {
                  articalBookmark.add(widget.artical);
                } else {
                  articalBookmark.remove(widget.artical);
                }
                setState(() {});
              },
              icon: Icon(
                Icons.favorite,
                color: articalBookmark.contains(widget.artical)
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

List<ArticalModel> tempResult = [];

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempResult= [...articalBookmark] ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            tempResult.clear();
            for (var i = 0; i < articalBookmark.length; i++) {
              print("object");
              if (articalBookmark[i].title.contains(value)) {
                tempResult.add(articalBookmark[i]);
              }
            }
            print(articalBookmark.length);
            print(tempResult.length);
            setState(() {});
          },
        ),
      ),
      body: tempResult.isEmpty
          ? Center(
              child: Text(
                "There is No Artical marked herer",
                style: TextStyle(fontSize: 22),
              ),
            )
          : ListView.builder(
              itemCount: tempResult.length,
              itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                  onPressed: () {
                    articalBookmark.removeAt(index);
                    tempResult = [...articalBookmark];
                    setState(() {});
                  },
                  icon: Icon(Icons.book),
                ),
                title: Text(tempResult[index].title),
              ),
            ),
    );
  }
}
