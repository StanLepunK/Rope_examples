/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* Draw multi bloc
* v 0.0.1
* 2019-2019
*/

ArrayList<R_Bloc> list_bloc;
boolean add_new_bloc_is = true;
boolean bloc_build_is = true;
boolean bloc_manage_is = false;
boolean bloc_selected_is = false;

void setup() {
	// fullScreen();
	size(400,400,P2D);
	rope_version();
	list_bloc = new ArrayList<R_Bloc>();
}

void draw() {
	background(r.SANG);
	//println("list bloc size",list_bloc.size());

	// show
	for(R_Bloc b : list_bloc) {
		b.show();
	}

	// simple build
	check_for_new_bloc();
	bloc_show_structure();
	if(bloc_build_is) {
		if(bloc_show_available_point()) {
			bloc_draw(true);
			add_new_bloc_is = false;
		} else {
			bloc_draw(true);
		}		
	}

	bloc_select();
	
	if(bloc_manage_is) {
		bloc_manage();
	}
	info();
}


void mousePressed() {
	if(bloc_build_is && add_new_bloc_is) {
		new_bloc();
		add_new_bloc_is = false;
	}
	if(!bloc_selected_is) {
		for(R_Bloc b : list_bloc) {
			b.select_is(false);
		}
	}
}

void mouseReleased() {
	if(bloc_build_is) {
		add_point_to_bloc_is(true);
	}
	bloc_selected_is = false;
}

void keyPressed() {
	if(keyCode == BACKSPACE) {
		list_bloc.clear();
	}

	if(key == 'n') {
		bloc_build_is = !bloc_build_is;
		if(bloc_build_is) bloc_manage_is = false;
		add_new_bloc_is = true;
	}

	if(key == 'm') {
		bloc_manage_is = !bloc_manage_is;
		if(bloc_manage_is) bloc_build_is = false;
	}
}


// info
void info() {
	if(bloc_build_is) {
		text("build bloc mode", 20,20);
	}

	if(bloc_manage_is) {
		text("manage bloc mode", 20,20);
	}

	for(R_Bloc b : list_bloc) {
		if(b.select_is()) {
			text("there is bloc selected", 20,40);
			break;
		} 
	}
}

/**
* DRAW MULTI BLOC METHOD
* v 0.0.1
* 2019-2019
*/
boolean add_point_to_bloc_is;
boolean add_point_to_bloc_is() {
	return add_point_to_bloc_is;
}

void add_point_to_bloc_is(boolean is) {
	add_point_to_bloc_is = is;
}

void check_for_new_bloc() {
	boolean check_for_new_bloc_is = false;
	// check the last current building bloc
	if(list_bloc.size() > 0) {
		int last_index = list_bloc.size() - 1;
		R_Bloc b = list_bloc.get(last_index);
		if(b.end_is()) {
			check_for_new_bloc_is = true;
		}
	} else {
		check_for_new_bloc_is = true;
	}

	// use the result
	if(check_for_new_bloc_is) {
		add_new_bloc_is = true;
	}
}

void new_bloc() {
	R_Bloc bloc = new R_Bloc();
	int id = list_bloc.size();
	bloc.set_id(id);
	bloc.set_magnetism(10);
	bloc.set_colour_build(r.CYAN);
	bloc.select_is(true);
	list_bloc.add(bloc);
}

void bloc_draw(boolean event_is) {
	if(event_is) {
		for(R_Bloc b : list_bloc) {
			if(b.select_is() || !b.end_is()) {
				if(mousePressed) {
					b.build(mouseX,mouseY,add_point_to_bloc_is());
					add_point_to_bloc_is(false);
				}
				b.show_struct();
				b.show_anchor_point();
			}	
		}
	}
}

void bloc_select() {
	for(int index = list_bloc.size() - 1 ; index >= 0 ; index--) {
		R_Bloc b = list_bloc.get(index);
		b.update(mouseX,mouseY);
		if(b.in_bloc(mouseX,mouseY)) {
			b.show_struct();
			if(!b.select_is() && !bloc_selected_is) {
				b.select_is(mousePressed);
				if(b.select_is()) {
					bloc_selected_is = true;
				}
			}
			break;
		}
	}
}


int bloc_index = -1;
int bloc_point_index = -1;
void bloc_manage() {
	if(!bloc_move()) {
		bloc_move_point();
	}
}

boolean bloc_move() {
	boolean event_is = false;
	if(bloc_index < 0 && bloc_point_index < 0) {
		for(int index = 0 ; index < list_bloc.size() ; index++) {
			R_Bloc b = list_bloc.get(index);
			boolean is = false;
			bloc_index = - 1;
			bloc_point_index = -1;
			if(mousePressed && b.select_is() && !b.select_point_is()) {
				bloc_index = index;
				bloc_point_index = -1;
				is = true;
			  event_is = true;
				break;
			}
			b.move(mouseX,mouseY,is);
		}
	} else if(bloc_index >= 0) {
		R_Bloc b = list_bloc.get(bloc_index);
		if(mousePressed && b.select_is() && !b.select_point_is()) {
			event_is = true;
			b.update(mouseX,mouseY);
			b.move(mouseX,mouseY,true);
		} else {
			bloc_point_index = -1;
			bloc_index = -1;
		}
	}
	return event_is;
}

void bloc_move_point() {
	if(bloc_point_index < 0 && bloc_index < 0) {
		for(int index = 0 ; index < list_bloc.size() ; index++) {
			R_Bloc b = list_bloc.get(index);
			bloc_point_index = -1;
			bloc_index = -1;
			b.move_point(mouseX,mouseY,mousePressed);
			if(b.select_point_is()) {
				bloc_point_index = index;
				bloc_index = -1;
				break;
			}		
		}
	} else if(bloc_point_index >= 0) {
		R_Bloc b = list_bloc.get(bloc_point_index);
		b.move_point(mouseX,mouseY,mousePressed);
		if(!b.select_point_is()) {
			bloc_point_index = -1;
			bloc_index = -1;
		}
	}
}

void bloc_show_structure() {
	for(R_Bloc b : list_bloc) {
		if(b.select_is()) {
			b.show_struct();
			b.show_anchor_point();
		}
	}
}

boolean bloc_show_available_point() {
	boolean event_is = false;
	for(R_Bloc b : list_bloc) {
		if(b.select_is()) {
			if(b.show_available_point(mouseX,mouseY)) {
				event_is = true;
			}
		}
	}
	return event_is;
}