/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
guide to code here: 
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*/



void setup() {
  size(300,300,P3D);
  

}

float dir_x =0;
float dir_y =0;
float dir_z =0;
float size_x = 0 ;
float size_y = 0 ;
float size_z =0;

void draw() {
  background(0);
  
  size_x = abs(sin(frameCount *.01) *(width/4));
  size_y = abs(sin(frameCount *.02) *(width/4));
  size_z = abs(sin(frameCount *.05) *(width/4));
  Vec3 size = Vec3(size_x,size_y,size_z);
  

  //Vec3 size = Vec3(width/10);
  dir_x += .02;
  dir_y += .05;
  dir_z += .01;
  Vec3 dir = Vec3(dir_x,dir_y,dir_z);
  


  float value = 2*(sin(frameCount *.005));
  set_ratio_costume_size(value);
  costume_rope(Vec3(width/2),size,dir,CROSS_BOX_3_ROPE);
  //costume_rope(Vec3(width/2),Vec3(width/4),dir_z,"TRUC");
}