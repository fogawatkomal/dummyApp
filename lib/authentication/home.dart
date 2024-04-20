import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [
    Post(
        user: 'User 1',
        imageUrl: 'https://picsum.photos/400/300?random=1',
        profileUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
    Post(
        user: 'User 2',
        imageUrl: 'https://picsum.photos/400/300?random=2',
        profileUrl: 'https://randomuser.me/api/portraits/women/2.jpg'),
    Post(
        user: 'User 3',
        imageUrl: 'https://picsum.photos/400/300?random=3',
        profileUrl: 'https://randomuser.me/api/portraits/men/3.jpg'),
    Post(
        user: 'User 3',
        imageUrl: 'https://picsum.photos/400/300?random=3',
        profileUrl: 'https://randomuser.me/api/portraits/men/3.jpg'),
    Post(
        user: 'User 3',
        imageUrl: 'https://picsum.photos/400/300?random=3',
        profileUrl: 'https://randomuser.me/api/portraits/men/5.jpg'),
    Post(
        user: 'User 3',
        imageUrl: 'https://picsum.photos/400/300?random=3',
        profileUrl: 'https://randomuser.me/api/portraits/women/4.jpg'),
  ];

  List<Story> stories = [
    Story(
        user: 'User ',
        profileImageUrl: 'https://picsum.photos/id/237/200/300',
        storyImageUrl: 'https://picsum.photos/400/300?random=4'),
    Story(
        user: 'User 5',
        profileImageUrl: 'https://picsum.photos/id/238/200/300',
        storyImageUrl: 'https://picsum.photos/400/300?random=5'),
    Story(
        user: 'User 6',
        profileImageUrl: 'https://picsum.photos/id/239/200/300',
        storyImageUrl: 'https://picsum.photos/400/300?random=6'),
    Story(
        user: 'user',
        profileImageUrl: 'https://picsum.photos/id/240/200/300',
        storyImageUrl: 'https://picsum.photos/400/300?random=6'),
    Story(
        user: 'user',
        profileImageUrl: 'https://picsum.photos/id/241/200/300',
        storyImageUrl: 'https://picsum.photos/400/300?random=6'),
    Story(
        user: 'user',
        profileImageUrl: 'https://picsum.photos/100',
        storyImageUrl: 'https://picsum.photos/400/300?random=6'),
    Story(
        user: 'user',
        profileImageUrl: 'https://picsum.photos/100',
        storyImageUrl: 'https://picsum.photos/400/300?random=6')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Testing Media'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(stories[index].profileImageUrl),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(stories[index].user),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostCard(
                  post: posts[index],
                  onLike: () {
                    setState(() {
                      posts[index].isLiked = !posts[index].isLiked;
                    });
                  },
                  onComment: () {
                    // Open modal for writing and previewing comments
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CommentModal(
                          post: posts[index],
                        );
                      },
                    );
                  },
                  onFollow: () {
                    setState(() {
                      posts[index].isFollowing = !posts[index].isFollowing;
                    });
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

class Story {
  final String user;
  final String profileImageUrl;
  final String storyImageUrl;

  Story({
    required this.user,
    required this.profileImageUrl,
    required this.storyImageUrl,
  });
}

class Post {
  final String user;
  final String imageUrl;
  final String profileUrl;
  bool isLiked;
  bool isFollowing;

  Post({
    required this.user,
    required this.imageUrl,
    required this.profileUrl,
    this.isLiked = false,
    this.isFollowing = false,
  });
}

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onFollow;

  const PostCard({
    super.key,
    required this.post,
    this.onLike,
    this.onComment,
    this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      //  margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(post.profileUrl),

                // Display first letter of user's name
              ),
            ),
            title: Text(post.user),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle more options
              },
            ),
          ),
          Image.network(
            post.imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        post.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: post.isLiked ? Colors.red : null,
                      ),
                      onPressed: onLike,
                    ),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline),
                      onPressed: onComment,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
                  onPressed: onFollow,
                  child: Text(
                    post.isFollowing ? 'Unfollow' : 'Follow',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentModal extends StatefulWidget {
  final Post post;

  const CommentModal({required this.post});

  @override
  _CommentModalState createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  List<String> comments = [];
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Comments',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index]),
                );
              },
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration:
                      const InputDecoration(labelText: 'Write a comment'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  String comment = _commentController.text.trim();
                  if (comment.isNotEmpty) {
                    setState(() {
                      comments.add(comment);
                      _commentController.clear();
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
