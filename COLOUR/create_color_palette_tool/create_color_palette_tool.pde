/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* exemple: color_pool
*
* WARNING
* all the setting is based on the current value ColorMode but in HSB.
* For the range hue, saturation, brightness and alpha use g.colorModeX, ...Y, ...Z and ...A for the max
* but don't need to change the colorMode environement
*
* v 0.2.0
* 2019-2019
*/
int cols = 10;
int rows = 10;
int [] palette;
int cell_x;
int cell_y;
int num;
void setup() {
	print_constants_colour_rope();
	rope_version();
	size(400,400);

	cell_x = width / rows;
	cell_y = height / cols;
	num = cols *rows;
	// palette = color_pool(num);
	palette = color_pool(num,20,100);
}

void draw() {
	int count = 0;
	for(int x = 0 ; x < rows ; x++) {
		for(int y = 0 ; y < cols ; y++) {
      int px = x*cell_x;
      int py = y*cell_y;
			noStroke();
			fill(palette[count]);
			rect(px,py,cell_x,cell_y);
			count++;
		}
	}
}

void keyPressed() {
	if(key == 'i') gen_palette_int();
	if(key == 'f') gen_palette_full();
	if(key == 's') gen_palette_simple();
	if(key == 'g') gen_palette_group();
	if(key == 'h') gen_palette_hsb();
}

void gen_palette_full() {
	// all the setting is based on HSB,360,100,100,100
	int num_group = 3;
	int hue_key = 20;
	int hue_range = 30;
	vec2 range_sat = vec2(100);
	vec2 range_bri = vec2(100);
	vec2 range_alp = vec2(100);
	palette = color_pool(num,num_group,hue_key,hue_range, range_sat,range_bri,range_alp);
}

void gen_palette_hsb() {
	// all the setting if based on HSB,360,100,100,100
	int num_group = 1;
	int hue_key = 20;
	int hue_range = 30;
	vec2 range_sat = vec2(90,100);
	vec2 range_bri = vec2(30,50);
	palette = color_pool(num,num_group,hue_key,hue_range, range_sat,range_bri);
}


void gen_palette_int() {
	// all the setting if based on HSB,360,100,100,100
	// the range of hue, satutarion and brightness is calculated around the colour reference
	int num_group = 1;
	int hue_key = 20;
	int hue_range = 30;
	int sat_range = 10;
	int bri_range = 10;
	palette = color_pool(num,num_group,r.MAGENTA,hue_range,sat_range,bri_range);
}

void gen_palette_simple() {
	int hue_key = 20;
	int hue_range = 30;
	palette = color_pool(num,hue_key,hue_range);
}

void gen_palette_group() {
	int group = 5;
	int hue_key = 20;
	int hue_range = 30;
	palette = color_pool(num,group,hue_key,hue_range);
}


