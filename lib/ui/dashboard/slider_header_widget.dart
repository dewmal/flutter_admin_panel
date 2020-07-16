import 'package:flutter/material.dart';

var userProfileImageUrl =
    "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80";

class SliderHeaderComponent extends StatelessWidget {
  const SliderHeaderComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 48,
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(userProfileImageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Charly Thompsan",
                    style: textTheme.subtitle2
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Admin",
                    style: textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
