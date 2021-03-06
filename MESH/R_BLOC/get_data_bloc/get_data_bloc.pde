/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* R_Bloc example
* example : create bloc, set bloc and catch bloc setting
* v 0.0.2
* 2019-2021
*/

R_Bloc bloc;
void setup() {
	size(400,400,P2D);
	rope_version();
	vec2 [] list = {vec2(10,10), vec2(width/2,height/2), vec2(250,50), vec2(10,10)};
	bloc = create_bloc(list);
	bloc.set_name("my name is Joe");
	println("what your name?",bloc.get_name());
}



void draw() {
	background(r.SANG);
	if(mousePressed) {
		bloc.fill(r.ORANGE);
	} else {
		bloc.fill(r.YELLOW);
	}
	bloc.show();
}


void keyPressed() {
	if(key == 's') {
		println("name | num of step | int fill | int stroke | float thickness | type = 0 | main ax | main ay"); 
		println("name | num of step | int fill | int stroke | float thickness | type = 1 | control x1 | control y1 | control x2 | control y2 | main ax | main ay");
		println(bloc.get_data());
	}
}
