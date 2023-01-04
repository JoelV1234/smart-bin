import 'package:equatable/equatable.dart';

void main() {
  List<Hello> p = [
    Hello(10),
    Hello(100),
    Hello(30)
  ]..sort((a,b) => a.m.compareTo(b.m));
  print(p);
}

class Hello extends Equatable{
  int m;
  Hello(this.m);


  @override
  String toString() {
      return m.toString();
  }
  
  @override
  // TODO: implement props
  List<Object> get props => [m];
}
