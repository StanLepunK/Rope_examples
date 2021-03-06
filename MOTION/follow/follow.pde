/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

/**
* example follox 
* v 0.2.0
*
* method follow
*
* vec2 follow(vec2 target, float speed, vec2 buf):
* vec2 follow(vec2 target, vec2 speed, vec2 buf);
* vec2 follow(float tx, float ty, float speed, vec2 buf);
* vec2 follow(float tx, float ty, float sx, float sy, vec2 buf);
* vec3 follow(vec3 target, float speed, vec3 buf);
* vec3 follow(vec3 target, vec3 speed, vec3 buf);
* vec3 follow(float tx, float ty, float tz, float speed, vec3 buf);
* vec3 follow(float tx, float ty, float tz, float sx, float sy, float sz, vec3 buf);
*/

/*
* WARNING
* the argument buf is use to buffering ans store the position in most of case this value is set at like vec2() or vec3()
* but you can use to reset the starting position.
*/

vec2 buf_a;
vec2 buf_b;
void setup() {
	size(400,400,P2D);
	rope_version();
	buf_a = new vec2();
	buf_b = new vec2(width/2,height/2);
}


void draw() {
	background(255,0,0);
	float speed = 0.01;
	vec2 a = follow(mouseX,mouseY, speed, buf_a);
	ellipse(a,50);
	
	vec2 speed2D = vec2(0.01,0.05);
	vec2 target = vec2(mouseX,mouseY);
	if(mousePressed)buf_b.set(width/2,height/2);
	vec2 b = follow(target, speed2D, buf_b);
	ellipse(b,25);
}
