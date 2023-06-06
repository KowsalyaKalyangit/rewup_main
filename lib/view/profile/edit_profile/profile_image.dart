import 'package:rewup/controller/profile_controller.dart';

import '../../../allpackages.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.00.h,
      left: 120.0.w,
      child: SizedBox(
        width: 120.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55.0,
                    child: CircleAvatar(
                      backgroundColor: appbarcolor,
                      radius: 52.0,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 50.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    profileController.username.text.toString(),
                    textAlign: TextAlign.center,
                    style: editprofilename,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
