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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.greenAccent,
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
          const Icon(Icons.person, size: 100, color: Colors.blueAccent),
          const SizedBox(height: 25),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder()),
            validator: MultiValidator([
              RequiredValidator(errorText: 'Masukkan alamat email yang valid'),
            ]).call,
          ),
        const SizedBox(height: 25),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder()),
            obscureText: true,
            validator: RequiredValidator(errorText: 'Kata sandi di perlukan'),
          ),
          SizedBox(height: 25),
          ElevatedButton(
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
                        // Jika berhasil login, arahkan ke halaman homepage dengan fullname
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(fullname: fullname.toString())),
                        );
                      } else {
                        // Jika login gagal, tampilkan pesan error
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Email atau Kata Sandi Salah')),
                        );
                      }
                    }
                  },
                  child: const Text("Login"),
                ),
          const SizedBox(height: 25,),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Register');
            },
             child: Text('Belum punya akun? Register'))
        ],
      ),
      ),
        ),
      ),
    );
  }
}