class Boton
{
  //atributos
  int Xposicion;
  int Yposicion;
  int ancho;
  int altura;
  color btn= color(#679FCB);
  int identidad;
  

  //metodos
  void Mostrar() {

    fill(btn);
    
  }
  
  //limites
  boolean MouseIsOver() {

    if (mouseX>=Xposicion && mouseX<=Xposicion+ancho && mouseY>=Yposicion && mouseY<=Yposicion+altura) {
      btn=color(#0F4952);
      return true;
    } else {
      btn= color(#679FCB);
      return false;
    }
  }
}

class BotonImagen extends Boton{

  PImage imagen;
  
  BotonImagen(int Xposicion, int Yposicion, int ancho, int altura,PImage imagen,int identidad)
  { 

    this.Xposicion=Xposicion;
    this.Yposicion=Yposicion;
    this.ancho=ancho;
    this.altura=altura;
    this.imagen=imagen;
    this.identidad=identidad;
  }


  void Mostrar() {//para imagen

    fill(btn);
    rect(Xposicion, Yposicion, ancho,altura,4);
    fill(0);
    text(identidad, Xposicion+5, Yposicion+10);
    image(imagen,Xposicion+4, Yposicion+9, ancho-9,altura-9);
  }
}
class BotonTexto extends Boton{

  String texto;
  
  BotonTexto(int Xposicion, int Yposicion, int ancho, int altura,String texto,int identidad)
  { 

    this.Xposicion=Xposicion;
    this.Yposicion=Yposicion;
    this.ancho=ancho;
    this.altura=altura;
    this.texto=texto;
    this.identidad=identidad;
  }


 public void Mostrar() {//para texto

    fill(btn);
    rect(Xposicion, Yposicion, ancho,altura,4);
    fill(#88B5E0,180);
    noStroke();
    rect(Xposicion, Yposicion, ancho,altura/2,4);
    fill(#E5F1FC,100);
    rect(Xposicion+6, (Yposicion+altura/3)+2, ancho-8,altura/9,2);
    fill(0);
    text(identidad, Xposicion+5, Yposicion+10);
    text(texto,Xposicion+15, Yposicion+25);
  }
}