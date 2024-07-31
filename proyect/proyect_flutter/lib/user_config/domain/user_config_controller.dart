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

  // VALIDATES INPUTS
  Map<String, String?>? checkIfProfileError() {
    Map<String, String?>? error;
    if (_userNameController.text == '') {
      error = {
        'errorTitle': 'UserName empty',
        'errorMessage': "UserName can't be empty"
      };
      return error;
    }
    if (_emailController.text == '' && (widget.userInfo.email != null)) {
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
      // User change
      try {
        // Try to updateUser. If UserName already exists in the DB and error will raise.
        if (_userNameController.text != widget.user.userName) {
          bool userExists = await widget.client.usersRegistry.checkUserExistanceByName(_userNameController.text);
          if (!userExists){
            UsersRegistry updatedUser =  widget.user;
            updatedUser.userName = _userNameController.text;
            await widget.client.usersRegistry.updateUser(updatedUser);
          }
          else {
            showDialog(
              context: context,
              builder: (BuildContext context) => const CustomAlertDialog(
                    customTitle: 'Error',
                    customContent: 'User is already in the DB',
                  ));
            return;
          }
        }
        // UPDATE USER INFO
        UserInfo updateUserInfo = widget.userInfo;
        updateUserInfo.userName = _userNameController.text;
        updateUserInfo.email = (_emailController.text == '')? null : _emailController.text; 
        updateUserInfo.fullName = (_fullNameController.text == '')? null : _fullNameController.text;
        await widget.client.usersRegistry.updateUserInfo(updateUserInfo);

          
        if (mounted) {
          showDialog(
              context: context,
              builder: (BuildContext context) => const CustomAlertDialog(
                    customTitle: 'User updated!',
                    customContent: 'UserInfo was correctly updated.',
                  )
          );
        }
      } catch (e) {
        // UserName already exists.
        if (mounted) {
          showDialog(
              context: context,
              builder: (BuildContext context) => const CustomAlertDialog(
                    customTitle: 'Error',
                    customContent: 'Error raised',
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
