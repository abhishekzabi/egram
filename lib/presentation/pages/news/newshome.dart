
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/news/adminpage.dart';
import 'package:egram/presentation/pages/news/newscard.dart';
import 'package:egram/service/newsservice.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NewsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor().scaffoldcolor,
      appBar: AppBar(
    
         automaticallyImplyLeading: false,
        title:const  Text("Latest News",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
         actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PasswordEntryPage()));
          
          }, icon:const Icon(Icons.settings,size: 30,)),
        ),
      ],
      ),
      
      body: Column(
        children: [
           const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                
                }, icon: const Icon(Icons.arrow_back_ios_new_outlined,size: 28,color: Colors.white,)),
                const SizedBox(width: 20,),
              const  Text("Headline",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
          ),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: NewsService().getNewsStream(), // Fetch the news stream
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator()); // Show loading indicator
                }
                
                // If data is present, display the news
                final newsDocs = snapshot.data!.docs;
            
                if (newsDocs.isEmpty) {
                  return const Center(child: Text('No news available at the moment.'));
                }
            
                return ListView.builder(
                  itemCount: newsDocs.length,
                  itemBuilder: (context, index) {
                    var newsData = newsDocs[index].data() as Map<String, dynamic>;
                    
                    String title = newsData['heading'] ?? 'Untitled';
                    String paragraph = newsData['content'] ?? 'No content available';
                    String imageUrl = newsData['imageUrl'] ?? ''; // Image URL from Firebase Storage
            
                    return NewsCard(
                      title: title,
                      content: paragraph,
                      imageUrl: imageUrl,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
