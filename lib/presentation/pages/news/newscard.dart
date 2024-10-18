
import 'package:egram/config/colors.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  final String title;
  final String content;
  final String imageUrl;

  NewsCard({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isExpanded = false; // Track whether the text is expanded or not

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolor().scaffoldcolorwhite,
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Image if exists
            widget.imageUrl.isNotEmpty
                ? Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: NetworkImage(widget.imageUrl),fit: BoxFit.cover)
                  ),
      
                )
                : Container(),
            const SizedBox(height: 10),

            // Display Title
            Text(
              widget.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            
            LayoutBuilder(
              builder: (context, constraints) {
            
                final span = TextSpan(text: widget.content);
                final tp = TextPainter(
                  text: span,
                  maxLines: isExpanded ? null : 10, 
                  textDirection: TextDirection.ltr,
                );
                tp.layout(maxWidth: constraints.maxWidth);

                final isOverflowing = tp.didExceedMaxLines;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Text(
                      widget.content,
                      maxLines: isExpanded ? null : 10, // Show full text if expanded
                      overflow: TextOverflow.fade, // Fade the overflowed text
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 16),
                    ),

                    // Show "Read More" or "Read Less" button if content overflows
                    if (isOverflowing)
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Text(
                          isExpanded ? 'Read Less' : 'Read More',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
