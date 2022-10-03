import 'package:flutter/material.dart';

class three_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tercera pagina'),
      ),
      body: Center(
        child: SizedBox( //Crea un cuadro que será tan grande como lo permita su padre
            height: double.infinity,
            width: 250,
            child: Container(
              color: Colors.blueGrey,

              child: ListView(  children: [
                Container(
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50.0,
                  child: const Text('A'),
                ),  const Spacer(flex: 1,),
                Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('B'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                )

                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('C'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                )
                ),const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                  child: const Text('D'),
                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('E'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('F'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('G'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('H'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('I'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('J'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),

                ),
                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('K'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                   ),

                const Spacer(),
                   Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('L'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                   ),
                  const Spacer(),
                  Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('M'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('N'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('Ñ'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),

              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('O'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('P'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('Q'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('R'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('S'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('T'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('U'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('V'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),

              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('W'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),

              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('W'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),

              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('X'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),

              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('Y'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
              ),

              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: const Text('Z'),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
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