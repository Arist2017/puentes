//minijuego 

Boton[] botonimg, botontxt;
int imagenes[] = new int [8];
int textos[] = new int [8];
int comparador;
int comparador2;
int puntos;
PImage[] imag;
int[][] estadosBoton = new int [8][2]; 
int waitingImage=10;
int waitingText=10;

int i=0, i2=0, cantidad=8, rango=8;
int[] arr= new int [cantidad];
int[] arr2= new int [cantidad];

void setup() {

  botonimg = new Boton[8];

  imag =new PImage[8];
  imag[0] = loadImage("salta.jpg");
  imag[1] = loadImage("boyaca.png");
  imag[2] = loadImage("ayacucho.jpg");
  imag[3] = loadImage("gameza.jpg");
  imag[4] = loadImage("junin.jpg");
  imag[5] = loadImage("paya.jpg");
  imag[6] = loadImage("tucuman.jpg");
  imag[7] = loadImage("pantano.jpg");



  int j=0;
  float rin=random(0, rango);
  j=floor(rin);
  arr[i]=j;

  for ( i=1; i<cantidad; i++) {
    j=0;
    rin=random(0, rango);
    j=floor(rin);
    arr[i]=j;
    for (int y=0; y<i; y++) {
      if (arr[i]==arr[y]) {
        i--;
      }
    }
  }

  int j2=0;
  float rin2=random(0, rango);
  j2=floor(rin2);
  arr2[i2]=j2;

  for ( i2=1; i2<cantidad; i2++) {
    j2=0;
    rin2=random(0, rango);
    j2=floor(rin2);
    arr2[i2]=j2;
    for (int y=0; y<i2; y++) {
      if (arr2[i2]==arr2[y]) {
        i2--;
      }
    }
  }

  for (int i=0; i<8; i++) {
    //mantener dos botones
    //mantenerEstado[i][0]=false;
    if (i<4) {

      botonimg[i] = new BotonImagen(102+i*120, 20, 100, 80, imag[arr[i]], arr[i]);
    } else {

      botonimg[i] = new BotonImagen(-379+i*120, 120, 100, 80, imag[arr[i]], arr[i]);
    }
    //primer estado(neutral)
    estadosBoton[i][0]=1;
  }


  botontxt= new Boton[8];
  for (int i=0; i<8; i++) {
    //mantener dos botones

    if (i<4)
    {
      botontxt[i] = new BotonTexto(102+i*170, 280, 150, 50, " ", arr2[i]);

    } else {
      botontxt[i] = new BotonTexto(-578+i*170, 340, 150, 50, " ", arr2[i]);
    }
    estadosBoton[i][1]=1;
  }

  size(820, 460);
  background(#7ED9E8);
}
void draw() {
  background(255);
  //crear arreglo 
  for (int i=0; i<8; i++)
  {
    botonimg[i].Mostrar();
    botontxt[i].Mostrar();
  }
  OutputResultado(0, 1);
  OutputResultado(1, 0);
  OutputResultado(2, 3);
  OutputResultado(3, 4);
  OutputResultado(4, 2);
  OutputResultado(7, 5);
  OutputResultado(6, 7);
  OutputResultado(5, 6);

  //colores botones si es falso o verdadero

  fill(9);
  text("puntos="+puntos, 660, 120);
  // esto es para que no esxitan dos botones que hayan sido preionados a la vez y ademas me muestra el ultimo tocado 

  for (int i=0; i<botonimg.length; i++) {

    if (estadosBoton[i][0]==4) {
      estadosBoton[i][0]=1;
    }
    if (i==waitingImage) {

      fill(#0F4952, 180);//azul grisoso
      rect(botonimg[i].Xposicion, botonimg[i].Yposicion, botonimg[i].ancho, botonimg[i].altura, 4);
    }
  }

  for (int i=0; i<botontxt.length; i++) {

    if (estadosBoton[i][1]==4) {
      estadosBoton[i][1]=1;
    }

    if (i==waitingText) {

      fill(#0F4952, 180);//azul grisoso
      rect(botontxt[i].Xposicion, botontxt[i].Yposicion, botontxt[i].ancho, botontxt[i].altura, 4);
    }
  }
  println("img "+comparador +" <->  txt "+comparador2);
}
void Comparar(int a, int b) {
  if (botonimg[a].identidad==comparador && botontxt[b].identidad==comparador2 ) {
    estadosBoton[a][0]=3;
    estadosBoton[b][1]=3;
  }
}
void OutputResultado(int a, int b) {
  //cambia de color el boton

  if (estadosBoton[a][0]==3) {
    fill(2, 24, 213, 200);//blue
    rect(botonimg[a].Xposicion, botonimg[a].Yposicion, botonimg[a].ancho, botonimg[a].altura, 6);
  } 
  if (estadosBoton[b][1]==3) {
    fill(2, 24, 213, 200);//blue
    rect(botontxt[b].Xposicion, botontxt[b].Yposicion, botontxt[b].ancho, botontxt[b].altura, 6);
  }
  if (estadosBoton[a][0]==2) {

    fill(219, 95, 95, 200);//red
    rect(botonimg[a].Xposicion, botonimg[a].Yposicion, botonimg[a].ancho, botonimg[a].altura, 6);
  }
  if (estadosBoton[b][1]==2) {
    fill(219, 95, 95, 200);//red
    rect(botontxt[b].Xposicion, botontxt[b].Yposicion, botontxt[b].ancho, botontxt[b].altura, 6);
  }
}
void keyPressed() {

  if (key==' ') {
    waitingImage=10;
    waitingText=10;
    if (comparador<10 && comparador2<10 ) {

      //me compara y cambia el estado de los botones(si es verdadera la respuestas)
      if (comparador==comparador2) {

        for (int i=0; i<botonimg.length; i++) {
          for (int j=0; j<botonimg.length; j++) {

            if (comparador==botonimg[i].identidad && comparador2==botontxt[j].identidad) {
              Comparar(i, j);
              OutputResultado(i, j);
            }
          }
        }
      }
      //me compara y cambia el estado de los botones(si es falsa la respuestas)
      if (comparador!=comparador2) {
        for (int i=0; i<8; i++) {
          //println("paso");
          if (botonimg[i].identidad==comparador) {
            estadosBoton[i][0]=2;
          }
        }
        for (int j=0; j<8; j++) {

          if (botontxt[j].identidad==comparador2 ) {
            estadosBoton[j][1]=2;
          }
        }
      }
      // suma o resta los puntos
      if (comparador==comparador2) {
        puntos+=5;
        //estos cambios son para que oblige al jugador a seguir,buscar otra respuesta
        comparador=10;
        comparador2=10;
      } else {
        puntos-=5;
        comparador=10;
        comparador2=10;
      }
    }
  }
}
void mousePressed() {


  //botones imagenes con metodo limites
  for (int i=0; i<botonimg.length; i++) {
    if (botonimg[i].MouseIsOver() && estadosBoton[i][0]==1) {
      comparador=botonimg[i].identidad;
      waitingImage=i;
    }
  }

  //botones txt con metodo limites
  for (int i=0; i<8; i++) {
    if (botontxt[i].MouseIsOver() && estadosBoton[i][1]==1) {
      comparador2=botontxt[i].identidad;
      waitingText=i;
    }
  }
}