import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:social_media_feed/core/utils/app_assets.dart';
import 'package:social_media_feed/core/utils/app_colors.dart';
import 'package:social_media_feed/core/widgets/my_interaction_button.dart';
import 'package:social_media_feed/feature/home/domain/entities/post.dart';

class PostComponent extends StatelessWidget {
  final Post post;

  const PostComponent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration:  BoxDecoration(color: Colors.white,),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              margin: EdgeInsets.only(right: 8,left: 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    AppAssets.appDefaultPicture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Transform.translate(
              offset: const Offset(-15, 0),
              child: Text(
                post.username,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            subtitle: Transform.translate(
              offset: const Offset(-11, 0),
              child: Row(
                children: [
                  Text("1  h"),
                  SizedBox(width: 8,),
                  Icon(
                    Icons.public,
                    size: 20,
                  ),
                ],
              ),
            ),
            trailing: Transform.translate(
              offset: const Offset(15, -10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.more_horiz)),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.clear)),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: ReadMoreText(
                            post.description,
                            textAlign: TextAlign.justify,
                            trimLength: 100,
                            moreStyle: const TextStyle(
                                color: Color.fromARGB(255, 119, 117, 117)),
                            lessStyle: const TextStyle(
                                color: Color.fromARGB(255, 109, 107, 107)),
                            trimCollapsedText: " read more",
                            trimExpandedText: "  show less",
                            trimMode: TrimMode.Length,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                     AppAssets.appOmarPicture,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  )
                ]),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(7, 8, 7, 5),
            child: const Column(children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    child: Image(
                      image: AssetImage(AppAssets.appLikeIcon,),
                      width: 25,
                    ),
                  ),
                  const Positioned(
                    left: 28,
                    child: SizedBox(
                      child: Text(
                        "omar and 632 others",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 17, color: Color.fromARGB(172, 0, 0, 0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 4,
              ),
              MyInteractionButton(
                  icon: Icons.thumb_up_alt_outlined,
                  number: 633,
                  onPressed: () {}),
              MyInteractionButton(
                  icon: Icons.comment_bank_outlined,
                  number: 477,
                  onPressed: () {}),
              MyInteractionButton(
                  icon: Icons.share, number: 36, onPressed: () {}),
              SizedBox(
                width: 4,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}


