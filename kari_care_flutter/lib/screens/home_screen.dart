import 'package:flutter/material.dart';
import 'package:kari_care_flutter/managers/photo_manager.dart';
import 'package:kari_care_flutter/models/photo.dart';
import 'package:kari_care_flutter/widgets/active_user.dart';
import 'package:kari_care_flutter/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PhotoManager manager = PhotoManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Discover",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Icon(
                        Icons.circle,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  ProfileAvatar(
                    imageProvider: AssetImage(
                      'assets/images/profile_image.png',
                    ),
                    radius: MediaQuery.of(context).size.width / 20,
                    hasBoarder: false,
                  ),
                ],
              ),
              StreamBuilder<List<Photo>>(
                  stream: manager.photoListFromPage2,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        return Center(
                          child: Text('Active users will be showned here'),
                        );

                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          Text(
                            'Ops Something went wrong \n ${snapshot.error}',
                            style: Theme.of(context).textTheme.caption,
                          );
                        }
                        if (snapshot.hasData) {
                          List<Photo> photos = snapshot.data;
                          return ActiveUser(
                            photos: photos,
                          );
                        }
                    }
                    return SizedBox.shrink();
                  }),
              // ignore: missing_return
              StreamBuilder(
                stream: manager.photoListFromPage3,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      Text(
                        'Ops Something went wrong \n ${snapshot.error}',
                        style: Theme.of(context).textTheme.caption,
                      );
                    }
                    if (snapshot.hasData) {
                      List<Photo> photos = snapshot.data;
                      return _buildPostView(photos);
                    }
                  }
                  return _buildShimmeerPostView();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildPostView(List<Photo> photos) {
    final List<Widget> list = [];
    for (var i = 0; i < photos.length; i++) {
      Photo photo = photos[i];
      list.add(Post(photo: photo));
    }
    return Column(
      children: list,
    );
  }

  _buildShimmeerPostView() {
    final List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(Post(
        isLoading: true,
        photo: null,
      ));
    }
    return Column(
      children: list,
    );
  }
}
