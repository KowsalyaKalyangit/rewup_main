import '../../allpackages.dart';
import 'edit_profile/edit_profile_screen.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 34.0,
            child: CircleAvatar(
              backgroundColor: appbarcolor,
              radius: 32.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                radius: 28.0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 3),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      'Nithish Sharma',
                      style: menuprofilesection,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const EditProfileScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 9),
              child: Image.asset(
                'assets/images/edit.png',
                height: 40,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
