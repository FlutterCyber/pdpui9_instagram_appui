import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9_instagram_appui/model/post_model.dart';
import 'package:pdpui9_instagram_appui/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  List<Post> post = [
    Post(
        username: "Brianne",
        userImage: "assets/images/user_1.jpeg",
        postImage: "assets/images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Henri",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Mariano",
        userImage: "assets/images/user_3.jpeg",
        postImage: "assets/images/feed_3.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            //stories
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stories",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "Watch all",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            //story list
            Container(
              //imageni eni telni ekrani bilan ir xil bo'lsin degani
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: stories.map((story) {
                  return itemOfStory(story);
                }).toList(),
              ),
            ),
            //story list
            Container(
              //imageni eni telni ekrani bilan ir xil bo'lsin degani
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: post.length,
                  itemBuilder: (ctx, i) {
                    return itemOfPost(post[i]);
                  }),
            ),
          ],
        ),
      )),
    );
  }

  Widget itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(story.name,style: TextStyle(color: Colors.grey),),
      ],
    );
  }

  Widget itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //aylana rasmchalani yasash un
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(post.username,style: TextStyle(color: Colors.grey),),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    print("aji buji");
                  },
                  icon: Icon(
                    SimpleLineIcons.options,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          //buni placeholderi bo'lganligi un ishlatyapmiz
          // ya'ni korsatilgan rasm bolmay qolgan payt
          // placeholderdagi rasmni chiqaradi
          FadeInImage(
            //imageni eni telni ekrani bilan ir xil bo'lsin degani
            width: MediaQuery.of(context).size.width,
            placeholder: AssetImage('assets/images/placeholder.png'),
            image: AssetImage(post.postImage),
          ),
          // like kommentlari rowi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print("heart");
                    },
                    icon: Icon(FontAwesome.heart_o,color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: () {
                      print("comment");
                    },
                    icon: Icon(FontAwesome.comment_o,color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {
                      print("sent");
                    },
                    icon: Icon(FontAwesome.send_o,color: Colors.grey),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesome.bookmark_o,color: Colors.grey,),
              ),
            ],
          ),
          //tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked by ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Abdusattorjon, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Tesha aka, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "G'olibboy, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: "1232 others ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          //caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: post.caption,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          //post date
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              "24 October",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
