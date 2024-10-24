import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_application_4/home_page.dart';
import 'package:flutter_application_4/register_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang'),
        backgroundColor: const Color.fromARGB(255, 16, 200, 225),
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          Image.asset('assets/icon_no_bg.png',
           height: 200,
           width: 200,),
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold),
            ),
           ),
            Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login untuk melanjutkan',
              style: TextStyle(fontSize: 15,
              color: Colors.black.withOpacity(0.5),
            ),
           ),
            ),
          const SizedBox(height: 25),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Masukkan email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email)),
            validator: MultiValidator([
              RequiredValidator(errorText: 'Masukkan alamat email yang valid'),
            ]).call,
          ),
        const SizedBox(height: 25),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Masukkan password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: (){
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
            obscureText: _isObscure,
            validator: RequiredValidator(errorText: 'Kata sandi di perlukan'),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 45,
          child: ElevatedButton(
            onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bool loginSuccess = false;
                      String? fullname;
          
                      for (var user in registerUser) {
                        if (user.email == _emailController.text &&
                            user.password == _passwordController.text) {
                          loginSuccess = true;
                          fullname = user.fullName;
                          break;
                        }
                      }
          
                      if (loginSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(fullname: fullname.toString())),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Email atau Kata Sandi Salah')),
                        );
                      }
                    }
                  },
                  child: const Text("Login"),
                ),
          ),
          const SizedBox(
            height: 25 ,),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Register');
            },
             child: const Text('Belum punya akun? Daftar'))
        ],
      ),
      ),
        ),
      ),
    );
  }
}