import 'package:d_man_admin/screens/main/main_dashboard.dart';
import 'package:d_man_admin/screens/provider/user_data_provider.dart';
import 'package:d_man_admin/utils/constant.dart';
import 'package:d_man_admin/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formData = FormData();

  var _isFormLoading = false;

  Future<void> _doLoginAsync({
    required UserDataProvider userDataProvider,
    required VoidCallback onSuccess,
    required void Function(String message) onError,
  }) async {
    AppFocusHelper.instance.requestUnfocus();

    if (_formKey.currentState?.validate() ?? false) {
      // Validation passed.
      _formKey.currentState!.save();

      setState(() => _isFormLoading = true);

      Future.delayed(const Duration(seconds: 1), () async {
        if (_formData.username != 'admin' || _formData.password != 'admin') {
          onError.call('Invalid username or password.');
        } else {
          await userDataProvider.setUserDataAsync(
            username: 'Admin ABC',
            userProfileImageUrl: 'https://picsum.photos/id/1005/300/300',
          );

          onSuccess.call();
        }

        setState(() => _isFormLoading = false);
      });
    }
  }

  void _onLoginSuccess(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (builder) => MainDashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding),
                    child: Image.asset(
                      'asset/logo.png',
                      height: 80.0,
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  color: Color(0xff171A20),
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Login",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700)),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: kDefaultPadding * 2.0),
                          child: Text(
                            "Login into your account",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        FormBuilder(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: kDefaultPadding * 1.5),
                                child: FormBuilderTextField(
                                  name: 'username',
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Icon(Icons.email)),
                                    hintText: "Enter Email",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    helperText: '* Demo username: admin',
                                    border: const OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    helperStyle: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  enableSuggestions: false,
                                  validator: FormBuilderValidators.required(),
                                  onSaved: (value) =>
                                      (_formData.username = value ?? ''),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: kDefaultPadding * 2.0),
                                child: FormBuilderTextField(
                                  name: 'password',
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(Icons.password),
                                    ),
                                    hintText: "Enter Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.4)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    helperText: '* Demo password: admin',
                                    helperStyle: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    border: const OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  enableSuggestions: false,
                                  obscureText: true,
                                  validator: FormBuilderValidators.required(),
                                  onSaved: (value) =>
                                      (_formData.password = value ?? ''),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: kDefaultPadding),
                                child: SizedBox(
                                  height: 40.0,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: (_isFormLoading
                                        ? null
                                        : () => _doLoginAsync(
                                              userDataProvider: context
                                                  .read<UserDataProvider>(),
                                              onSuccess: () =>
                                                  _onLoginSuccess(context),
                                              onError: (message) =>
                                                  ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(SnackBar(
                                                      content: Text(message))),
                                            )),
                                    child: Text("Login"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormData {
  String username = '';
  String password = '';
}
