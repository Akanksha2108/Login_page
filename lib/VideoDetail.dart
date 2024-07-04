import 'package:flutter/material.dart';

class VideoDetailPage extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String profilePictureUrl;
  final String username;
  final String views;
  final String location;
  final String agoDays;

  const VideoDetailPage({
    Key? key,
    required this.title,
    required this.thumbnailUrl,
    required this.profilePictureUrl,
    required this.username,
    required this.views,
    required this.location,
    required this.agoDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              thumbnailUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profilePictureUrl),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(username),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.remove_red_eye, size: 16),
                SizedBox(width: 4),
                Text(views),
                SizedBox(width: 16),
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                Text(location),
                SizedBox(width: 16),
                Icon(Icons.access_time, size: 16),
                SizedBox(width: 4),
                Text(agoDays),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    // Add your like functionality here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down),
                  onPressed: () {
                    // Add your dislike functionality here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
