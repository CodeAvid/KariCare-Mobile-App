import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kari_care_flutter/managers/managers.dart';
import 'package:kari_care_flutter/models/photo.dart';
import 'package:kari_care_flutter/themes/custom_colors.dart';
import 'package:kari_care_flutter/themes/text_style.dart';
import 'package:kari_care_flutter/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PhotoManager manager = PhotoManager();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {},
                        iconSize: 30.0,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.more_vert_outlined),
                        onPressed: () {},
                        iconSize: 30.0,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'My profile',
                        style: TextStyle(
                            color: CustomColors.darkBlueColor,
                            fontFamily: FontNameDefault,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ProfileAvatar(
                    imageProvider:
                        AssetImage('assets/images/profile_image.png'),
                    radius: MediaQuery.of(context).size.height / 15,
                    hasBoarder: false,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Anna Karenina',
                    style: TextStyle(
                        color: CustomColors.darkBlueColor,
                        fontFamily: FontNameDefault,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'University of Lagos\n Lagos Nigeria',
                    style: TextStyle(
                      color: CustomColors.blueColor,
                      fontFamily: FontNameDefault,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialCount('Photos', '10'),
                      _buildSocialCount('Followers', '146'),
                      _buildSocialCount('Following', '204'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: StreamBuilder<List<Photo>>(
                stream: manager.photoListFromPage1,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child:
                            Text('Ops something went wrong ${snapshot.error}'),
                      );
                    }
                    if (snapshot.hasData) {
                      List<Photo> photos = snapshot.data;
                      return StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        crossAxisCount: 4,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 12,
                        itemCount: photos.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ImageTile(image: photos[index].urls.small),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(2),
                      );
                    }
                  }
                  return StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    crossAxisCount: 4,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 12,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) =>
                        ImageTile(isLoading: true),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildSocialCount(String title, count) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: CustomColors.blueColor,
            fontFamily: FontNameDefault,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          count,
          style: TextStyle(
              color: CustomColors.darkBlueColor,
              fontFamily: FontNameDefault,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
