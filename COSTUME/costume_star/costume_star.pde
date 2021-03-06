/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

/**
* STAR example
* 2019-2021
* v 0.2.0
*/

import rope.costume.R_Costume;
void setup() {
  size(500,500,P3D);
}


vec3 dir = vec3();
void draw() {
  background_rope(0);
  vec3 pos = vec3(width/2,height/2,0);
  vec3 size = vec3(200,200,40);
  dir.add(.005,.003,.001);
  int fill = color(255,0,0,25);
  int stroke = color(255,0,0);
  float thickness =1;
  aspect(fill,stroke,thickness);
  R_Costume star = new R_Costume(this,r.STAR_3D);
	star.set_summits(36);
	star.set_ratio(.1,.2,.3,.4,.5,.6,.7,.8,.9);
	// println(star.get_ratio());
  costume(pos,size,dir,star);

  aspect(r.WHITE,r.WHITE,thickness);
  costume(pos,size,dir,r.STAR);
}
