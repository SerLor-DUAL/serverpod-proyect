part of '../presentation/user_config.dart';

abstract class UserProfileConfigController extends State<UserProfileConfig> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();


   @override
  void dispose() {
    _userNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _userNameController.text = widget.userInfo.userName ?? widget.user.userName;
    _fullNameController.text = widget.userInfo.fullName ?? '';
    _emailController.text = widget.userInfo.email ?? '';
  }

  // UPDATE USER PICTURE
  Future<void> updateUserPicture() async {
    await showDialog(
        context: context,
        builder: (context) {
          return ProfilePictureSelector(
            userInfo: widget.userInfo,
            client: widget.client,
          );
        });
  }

  Map<String, String?>? checkIfProfileError() {
    Map<String, String?>? error;
    if (_userNameController.text == '') {
      error = {
        'errorTitle': 'UserName empty',
        'errorMessage': "UserName can't be empty"
      };
      return error;
    }
    if (_emailController.text == '' && widget.userInfo.email != '') {
      error = {
        'errorTitle': "Email empty",
        'errorMessage':
            "Email can't be empty. If you want to change it, replace it."
      };
    }
    return error;
  }

  // UPDATES UserInfo and UserName if wanted to.
  Future<void> updateUserInfo() async {
    Map<String, String?>? error = checkIfProfileError();
    if (error == null) {
      // UserInfo
      UserInfo updateUserInfo = widget.userInfo;
      updateUserInfo.userName = _userNameController.text;
      updateUserInfo.fullName = _fullNameController.text;
      updateUserInfo.email = _emailController.text;
      // User change
      try {
        if (_userNameController.text != widget.user.userName) {
          UsersRegistry updatedUser = widget.user;
          updatedUser.userName = _userNameController.text;
          await widget.client.usersRegistry.updateUser(updatedUser);
        }
        await widget.client.usersRegistry.updateUserInfo(updateUserInfo);
        if (mounted) {
          showDialog(
              context: context,
              builder: (BuildContext context) => const CustomAlertDialog(
                    customTitle: 'UserUpdated',
                    customContent: 'UserInfo was correctly updated.',
                  )
          );
        }
      } catch (e) {
        if (mounted) {
          showDialog(
              context: context,
              builder: (BuildContext context) => CustomAlertDialog(
                    customTitle: 'Error',
                    customContent: e.toString(),
                  ));
        }
      }
    }
      else {
        showDialog(
            context: context,
            builder: (BuildContext context) => CustomAlertDialog(
                  customTitle: error['errorTitle']!,
                  customContent: error['errorMessage']!,
                ));
      }
  }
}
