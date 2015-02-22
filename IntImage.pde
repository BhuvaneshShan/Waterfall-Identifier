PImage img;
int[][] intImg;//Integral Image
boolean found = false;
void setup(){
  size(640,480);
  frameRate(5);
  img=loadImage("Waterfall-640x480.jpg");
  if(img.width!=640 && img.height!=480){
    img.resize(640,480);
  }
  intImg = new int[img.width][img.height];
  calculateIntImg(); //calculating integral image
}
int hParts,vParts; //number of horizontal and vertical slices
int hGap,vGap; //widht and height of the horizontal and vertical slices
void draw(){
  if(found==false){
    background(0);
    image(img,0,0);
    println(frameCount);
    hParts = frameCount+2; vParts = frameCount;
    hGap = (int)(img.width/hParts);
    vGap = (int)(img.height/vParts);
    int[][] vertex = new int[8][2];
    vertex[0][1]=0;
    while(vertex[0][1]+vGap<=img.height){
      vertex[0][0]=0;
      while(vertex[0][0]+3*hGap<=img.width){
       int left, mid, right;
       vertex[0][0]=vertex[0][0]+20; vertex[0][1]=vertex[0][1]+20;
       vertex[1][0]=vertex[0][0]+hGap; vertex[1][1]=vertex[0][1];
       vertex[2][0]=vertex[0][0]+2*hGap; vertex[2][1]=vertex[0][1];
       vertex[3][0]=vertex[0][0]+3*hGap; vertex[3][1]=vertex[0][1];
       vertex[4][0]=vertex[0][0]; vertex[4][1]=vertex[0][1]+vGap;
       vertex[5][0]=vertex[1][0]; vertex[5][1]=vertex[4][1];
       vertex[6][0]=vertex[2][0]; vertex[6][1]=vertex[4][1];
       vertex[7][0]=vertex[3][0]; vertex[7][1]=vertex[4][1];  
       left = getIntensity(vertex[0][0],vertex[0][1],vertex[1][0],vertex[1][1],vertex[5][0],vertex[5][1],vertex[4][0],vertex[4][1]);
       mid =  getIntensity(vertex[1][0],vertex[1][1],vertex[2][0],vertex[2][1],vertex[6][0],vertex[6][1],vertex[5][0],vertex[5][1]);
       right =  getIntensity(vertex[2][0],vertex[2][1],vertex[3][0],vertex[3][1],vertex[7][0],vertex[7][1],vertex[6][0],vertex[6][1]);
       if(isWaterfall(left,mid,right)==true){
         found=true;
         noFill();
         stroke(255,0,0);
         strokeWeight(5);
         rect(vertex[1][0],vertex[1][1],hGap,vGap);
       }
    }
  }
  }
}
int getIntensity(int ax,int ay,int bx,int by,int cx,int cy,int dx,int dy){
  ax=constrain(ax,0,img.width-1);bx=constrain(bx,0,img.width-1);cx=constrain(cx,0,img.width-1);dx=constrain(dx,0,img.width-1);
  ay=constrain(ay,0,img.height-1);by=constrain(by,0,img.height-1);cy=constrain(cy,0,img.height-1);dy=constrain(dy,0,img.height-1);
  return intImg[cx][cy]-intImg[bx][by]-intImg[dx][dy]+intImg[ax][ay];
}
boolean isWaterfall(int left, int mid, int right){
  if( mid > left && mid > right ){
    return true;
  }else{
    return false;
  }
}
void calculateIntImg(){
  //Integral image calculation
  for(int x=0;x<img.width;x++){
    for(int y=0;y<img.height;y++){
      int loc = x+y*img.width;
      int left = (x-1)+y*img.width;
      int top = x+(y-1)*img.width;
      int topleft = (x-1)+(y-1)*img.width;
      color value =color(intensity(loc));
      if(top>=0){
        value+=color(intensity(top));
      }
      if(left>=0){
        value+=color(intensity(left));
      }
      if(topleft>=0){
        value-=color(intensity(topleft));
      } 
      intImg[x][y]=value;
    }
  }
}

int intensity(int loc){
  //luminosity calculation
  return (int)(0.21*red(img.pixels[loc])+0.72*green(img.pixels[loc])+0.07*blue(img.pixels[loc]));  
}
