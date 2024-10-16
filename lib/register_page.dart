import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/user.dart';
import 'package:form_field_validator/form_field_validator.dart';

List<User> registerUser = [];

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override

  _RegisterPageState createState() => _RegisterPageState();
}
  class _RegisterPageState extends State<RegisterPage> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _fullnameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
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
            const Icon(Icons.person,size: 100,),
            const SizedBox(height: 25,),
            
            TextFormField(
              controller: _fullnameController,
              decoration: const InputDecoration(labelText: 'Nama Lengkap',border: OutlineInputBorder()),
              validator: 
                RequiredValidator(errorText: 'Nama Lengkap Di Perlukan').call,
              
            ),

            const SizedBox(height: 25,),
            
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder()),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email di Perlukan'),
                  EmailValidator(errorText: 'Masukkan Email yang Benar'),
                ]).call,
              
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder()),
              obscureText: true,
              validator: MultiValidator([
                    RequiredValidator(errorText: 'Password di Perlukan'),
                    MinLengthValidator(8,
                        errorText: 'Kata sandi minimal harus terdiri dari 8 digit'),
                  ]).call,
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                border: OutlineInputBorder()),
              obscureText: true,
              validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Kata sandi tidak cocok';
                    }
                    return null;
                  },
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      
                      registerUser.add(User(
                          fullName: _fullnameController.text,
                          email: _emailController.text,
                          password: _passwordController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Daftar akun Sukses!!')),
                      );
        
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  child: const Text("Daftar"),
                ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Sudah punya akun? Login'),
            ),
          ],
        ),
      ),
      ),
      ),
    );
  }
}
