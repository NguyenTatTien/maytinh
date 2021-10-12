import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState()=>_MyApp();
}
class _MyApp extends State<MyApp>{
   // This widget is the root of your application.
  List<String>Key1=["AC","+/-","%","/"];
  List<String>Key2=["7","8","9","x"];
  List<String>Key3=["4","5","6","-"];
  List<String>Key4=["1","2","3","+"];
  List<List>keys=[];
  List<Color>color1=[Colors.green,Colors.green,Colors.green,Colors.orange];
  List<Color>color2=[Colors.blue,Colors.blue,Colors.blue,Colors.orange];
  List<Color>color3=[Colors.blue,Colors.blue,Colors.blue,Colors.orange];
  List<Color>color4=[Colors.blue,Colors.blue,Colors.blue,Colors.orange];
  List<List>colors=[];
  String text_key="0";
  String operator="";
  bool ReStart=false;
  @override
  void initState(){
    text_key="0";
    operator="";
    keys.add(Key1);
    keys.add(Key2);
    keys.add(Key3);
    keys.add(Key4);
    colors.add(color1);
    colors.add(color2);
    colors.add(color3);
    colors.add(color4);
    
  }
  void input(String key){
    setState(() {
     if(ReStart==true){
         text_key="0";
          ReStart=false;
     }
     if(key!="="){
            if(text_key=="0"){
              if(key=="+"||key=="-"||key=="x"||key=="/"||key=="%"){
                text_key+=key;
                operator=key;
                
              }
              else{
                text_key=key;
               
              }
        }
         else{
         if(key=="+"||key=="-"||key=="x"||key=="/"||key=="%"){
              if(text_key.contains("+")||text_key.contains("-")||text_key.contains("x")||text_key.contains("/")||text_key.contains("%"))
              {
                  if(text_key[text_key.length-1]!='+'||text_key[text_key.length - 1]!='-'||text_key[text_key.length-1]!='x'||text_key[text_key.length - 1]!='/'||text_key[text_key.length-1]!='%'){
                      calculate(key);

                  }
              }
              else{
                operator=key;
                text_key+=key;
              }
            
          }
          else{
                
               text_key+=key;
          }
        
      }
     }
     else{
       calculate(key);
     }
     
     
    });
     }
  void calculate(String key){
   
    double soA=double.parse(text_key.substring(0,text_key.indexOf(operator)));
    double soB=double.parse(text_key.substring(text_key.indexOf(operator)+1,text_key.length));
     if(operator=="+"){
         
         text_key=(soA+soB).toString();
         operator=key;
        }
        else if(operator=="-"){
          text_key=(soA-soB).toString();
           operator=key;
        }
        else if(operator=="x"){
          text_key=(soA*soB).toString();
           operator=key;
        }
        else if(operator=="/"){
          if(soB==0){
            text_key="Resulf is undefined";
            ReStart==true;
          }
          else{
             text_key=(soA/soB).toStringAsFixed(3);
            operator=key;
          }
        }
        else if(operator=="%"){
            text_key=(soA%soB).toString();
            operator=key;
            
        }
        if(key!="="&&text_key!="Resulf is undefined"){
            text_key+=key;
            ReStart=false;
        }
        else{
          ReStart=true;
        }
    setState(() {
       text_key=text_key;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Calculator"),),backgroundColor: Colors.orange,),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
         
          Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(child:Text(text_key,style:TextStyle(fontSize: 50),),margin: EdgeInsets.only(right: 10,bottom: 5),alignment: Alignment.bottomRight,)
                  
                ],
          )),flex: 3,),
          for(int i=0;i<4;i++)
           Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
            for(int j=0;j<4;j++)
                     
                      Expanded(child: Container(
                          height:double.infinity,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 3),
                          child: ElevatedButton(onPressed: () =>input(keys[i][j]),child:Text(keys[i][j]),style:ElevatedButton.styleFrom(
                            shape:new CircleBorder(),
                            elevation: 2.0,
                             primary: colors[i][j],
                          
                         
                          
                          ),
                          
                        
                      )),flex: 1,),
                        

                    
                  ],
                ),
              )),flex:1),
           Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),child:Center(
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  
                   Expanded(child: Container(
                       height:double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 3),
                      child: ElevatedButton(onPressed: () =>input("0"),child:Text("0"),style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(300.0)
                      ),
                      primary: Colors.blue
                      ),
                      
                     
                   )),flex: 2,),
                   Expanded(child: Container(
                         height:double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 3),
                      child: ElevatedButton(onPressed: () =>input("."),child:Text("."),style:ElevatedButton.styleFrom(
                        shape:new CircleBorder(),
                            elevation: 2.0,
                             primary: Colors.blue,
                      ),
                      
                     
                   )),flex: 1,),
                     Expanded(child: Container(
                         height:double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 3),
                      child: ElevatedButton(onPressed: () =>input("="),child:Text("="),style:ElevatedButton.styleFrom(
                        shape:new CircleBorder(),
                        elevation: 2.0,
                        primary: Colors.blue,
                      
                      
                      ),
                      
                     
                   )),flex: 1,),

                
              ],
            ),
           )),flex: 1,)
          ],
        ),)
      ),
    
     
    );
  


}
}
