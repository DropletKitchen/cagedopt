
/////////////////////////////
//////Simple rig/////////////
/////////////////////////////


//the parts have been sliced into sheets (for lasercutting), if you 3D print, make 'combined' .stl-files of sheet1&2 (bottom part), sheet3&4 (stage), sheet5&6 (LED holder), and sheet7 (to clamp down the LED), by compiling, rendering and exporting the parts together 

//optional parts are commented out (remove '*' to see)
// add '#' to highlight part/subtraction in red (useful to find and investigate parts) 

////////////////////////////////////////////////////
//VARIABLES - change them according to your needs //
////////////////////////////////////////////////////

roundness_dia = 6;//bottom part: radius of rounded edges (should be bigger than radius screws: M6>3)
roundness_dia2 = 7;//xyz-stage, take care for it being big enough for leadscrews and wall
roundness_dia3 = 3;//roundness of lightfixtures
//
x=75;//x-dimension of screwholes (stands) of bottom plate in mm; min size required for fitting our x/y stage in is around x= 70mm
z=5; //sheet thickness if you use a laser cutter
zLED=3; //sheet thickness LED and lens fixture, again, for lasercutting
min_wallsize = 0;//distance between cut holes and part outlines, use >=3 when using M6 screws to accomodate the nuts, only used in lightfixtures, quite obsolete right now
prop=5;//proportion x:light fixture holes

//variables for kinematic stage
radius_centerhole1 = 16; // r of centerhole_stage, bottom plate
radius_centerhole2 = 16; // r of centerhole_stage, top plate

radius_screws = 3; //radius of screws used (default M6)
radius_leadscrewnut = 4.8; //radius of leadscrew-nut for z-stage


diameter_steelbar = 6; // diameter for steelbar-inserts, kinematic stage
radius_magnet = 10; //radius of magnets used for kinematic stage

y=(x-radius_screws-radius_magnet);//dimension (leadscrew-holes) of stage

stage_height = 30; //height of stage (just for drawing)
light_height = 100; //height of light fixture (just for drawing)
screw_connector1_height = 85; //height of screw connector1 (just for drawing), optional part (commented out)
screw_connector2_height = 70; //height of screw connector2 (just for drawing), optional part (commented out)

//Light fixture variables
LED_radius = 11.5; //half of the LED diameter
makesmaller = 1.5; //hole for LED to sit on (must be smaller than LED diameter)
LED_radius1 = LED_radius - makesmaller;
radius_LEDscrews = 1.5; //radius of screws on LED part (defaultM3)

//lens fixture variables (optional parts if you want to use a standard optics lens to focus the light onto the sample, commented out)
radius_LENS = 6.5; //radius of collimating lens used (1/2-inch optics)
indent_LENS = 1; //make radius smaller for parts that hold lens in place

//optional mounted xy-stage: variables
xystagemiddleholedistance = 55;//check your stage and figure out where/how to mount
xystagemiddleholeradius = 1.75;
xystageoffcenterholedistance = 55;
xystageoffcenterholeoffset = 17.5;
xystageoffcenterholeradius = 1.5;

//variables for illustration of added hardware
radius_leadscrew = 3.14;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////SHEET 0/-2 - (used for cage systems and PS3-systems as bottom sheet (instead of sheet 1)/////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
translate ([0,0,-12*z])
difference ()
{

$fn=50;
   color ("yellow", a=1.0)
   translate ([0,0,0])
   hull()
   {
        translate ([x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
   }

//screwholes
//top right
translate ([x, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom right
translate ([x, -x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom left
translate ([-x, -x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);

//screwholes for light-fixture
//top right
translate ([x/prop, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x/prop, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////SHEET 0/-1 - (used for cage systems only)///////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
translate ([0,0,-11*z])
difference ()
{

$fn=50;
   color ("gold", a=1.0)
   translate ([0,0,0])
   hull()
   {
        translate ([x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
   }

//centerhole
translate ([0, 0, -z]) 
cylinder(r = 3*radius_screws, h = 2*z, $fa=1, $fs=0.5);

//screwholes
//top right
translate ([x, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom right
translate ([x, -x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom left
translate ([-x, -x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
}

/////////////////////////////////////////////////////////////
/////////////////SHEET1 (bottom part)///////////////////////
////////////////////////////////////////////////////////////

difference ()
{

$fn=50;
   color ("yellow", a=1.0)
   translate ([0,0,0])
   hull()
   {
        translate ([x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
   }

//centerhole
translate ([0, 0, -z]) 
cylinder(r = radius_centerhole1, h = 2*z, $fa=1, $fs=0.5);

//screwholes
//top right
translate ([x, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom right
translate ([x, -x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom left
translate ([-x, -x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);

//screwholes for light-fixture
//top right
translate ([x/prop, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x/prop, x, -z]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
}

/////////////////////////////////////////////////////////////////////
////SHEET2 (bottom part, second layer with steel bars)//////////////
////////////////////////////////////////////////////////////////////

difference ()
{

$fn=50;
   color ("gold", a=1.0)
   translate ([0,0,z])
   hull()
   {
        translate ([x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
   }
//centerhole
translate ([0, 0, 0]) 
cylinder(r = radius_centerhole1, h = 2*z, $fa=1, $fs=0.5);

//screwholes
//top right
translate ([x, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom right
translate ([x, -x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom left
translate ([-x, -x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);

//screwholes for light-fixture
//top right
translate ([x/prop, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x/prop, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);

//magnet-inserts
//bottom right
translate ([y, -y, z]) 
rotate([0, 0, 90])
cylinder(h = 2*z, r=radius_magnet, $fa=1, $fs=0.5,center = true);

//bottom left
translate ([-y, -y, z]) 
rotate([0, 0, -90])
cylinder(h = 2*z, r=radius_magnet, $fa=1, $fs=0.5,center = true);

//top middle
translate ([0, y, z]) 
rotate([0, 0, 45])
cylinder(h = 2*z, r=radius_magnet, $fa=1, $fs=0.5,center = true);
//top middle (steelbar-insert)
translate ([0, y, z]) 
rotate([0, 0, 90])
cube ([2*radius_magnet+diameter_steelbar, 2*diameter_steelbar,2*z], center = true);


}

/////////////////////////////////////////////////////////////////////
////SHEET2.5 (bottom part, second layer with steel bars)//////////////
////////////////////////////////////////////////////////////////////
translate ([0,0,z]) 
{
difference ()
{

$fn=50;
   color ("yellow", a=1.0)
   translate ([0,0,z])
   hull()
   {
        translate ([x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-x,-x,0])
        cylinder(r = roundness_dia, h = z, $fa=1, $fs=0.5, center = true);
   }
//centerhole
translate ([0, 0, 0]) 
cylinder(r = radius_centerhole1, h = 2*z, $fa=1, $fs=0.5);

//screwholes
//top right
translate ([x, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom right
translate ([x, -x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//bottom left
translate ([-x, -x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);

//screwholes for light-fixture
//top right
translate ([x/prop, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-x/prop, x, 0]) 
cylinder(r = radius_screws, h = 2*z, $fa=1, $fs=0.5);

//magnet-inserts
//bottom right
translate ([y, -y, z]) 
rotate([0, 0, 90])
cylinder(h = 2*z, r=radius_magnet, $fa=1, $fs=0.5,center = true);

//bottom left
translate ([-y, -y, z]) 
rotate([0, 0, -90])
cylinder(h = 2*z, r=radius_magnet, $fa=1, $fs=0.5,center = true);

//top middle
translate ([0, y, z]) 
rotate([0, 0, 45])
cylinder(h = 2*z, r=radius_magnet, $fa=1, $fs=0.5,center = true);
//top middle (steelbar-insert)
translate ([0, y, z]) 
rotate([0, 0, 90])
cube ([2*radius_magnet+diameter_steelbar, 2*diameter_steelbar,2*z], center = true);


}}


/////////////////////////////////////////////////////////////
/////////////////SHEET3 (xyz-stage, first layer)//////////////////////
////////////////////////////////////////////////////////////

difference ()
{

$fn=50;
   color ("yellow", a=1.0)
   translate ([0,0,stage_height])
   hull()
   {
        translate ([y,y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-y,y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
        translate ([y,-y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-y,-y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
   }
//centerhole
translate ([0, 0, (stage_height-z)]) 
cylinder(r = radius_centerhole1, h = 2*z, $fa=1, $fs=0.5);

//leadscrewnut-holes
//top middle
translate ([0, y, (stage_height-z)]) 
cylinder(r = radius_leadscrewnut, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-y, -y, (stage_height-z)]) 
cylinder(r = radius_leadscrewnut, h = 2*z, $fa=1, $fs=0.5);
//bottom right
translate ([y, -y, (stage_height-z)]) 
cylinder(r = radius_leadscrewnut, h = 2*z, $fa=1, $fs=0.5);

//holes for a x/y stage (optional), if not used, comment out
//middle
translate ([0, -xystagemiddleholedistance, (stage_height-z)]) 
cylinder(r = xystagemiddleholeradius, h = 2*z, $fa=1, $fs=0.5);
//left
translate ([-xystageoffcenterholeoffset, -xystageoffcenterholedistance, (stage_height-z)])
cylinder(r = xystageoffcenterholeradius, h = 2*z, $fa=1, $fs=0.5);
//right
translate ([xystageoffcenterholeoffset, -xystageoffcenterholedistance, (stage_height-z)])
cylinder(r = xystageoffcenterholeradius, h = 2*z, $fa=1, $fs=0.5);

}

/////////////////////////////////////////////////////////////
/////////////////SHEET4 (xyz-stage, second layer)//////////////////////
////////////////////////////////////////////////////////////

difference ()
{

$fn=50;
   color ("gold", a=1.0)
   translate ([0,0,stage_height+z])
   hull()
   {
        translate ([y,y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-y,y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
        translate ([y,-y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
        translate ([-y,-y,0])
        cylinder(r = roundness_dia2, h = z, $fa=1, $fs=0.5, center = true);
   }
//centerhole
translate ([0, 0, (stage_height)]) 
cylinder(r = radius_centerhole2, h = 2*z, $fa=1, $fs=0.5);

//leadscrewnut-holes
//top middle
translate ([0, y, (stage_height)]) 
cylinder(r = radius_leadscrewnut, h = 2*z, $fa=1, $fs=0.5);
//top left
translate ([-y, -y, (stage_height)]) 
cylinder(r = radius_leadscrewnut, h = 2*z, $fa=1, $fs=0.5);
//bottom right
translate ([y, -y, (stage_height)]) 
cylinder(r = radius_leadscrewnut, h = 2*z, $fa=1, $fs=0.5);

//holes for a x/y stage (optional), if not used, comment out
//middle
translate ([0, -xystagemiddleholedistance, (stage_height)]) 
cylinder(r = xystagemiddleholeradius, h = 2*z, $fa=1, $fs=0.5);
//left
translate ([-xystageoffcenterholeoffset, -xystageoffcenterholedistance, (stage_height)])
cylinder(r = xystageoffcenterholeradius, h = 2*z, $fa=1, $fs=0.5);
//right
translate ([xystageoffcenterholeoffset, -xystageoffcenterholedistance, (stage_height)])
cylinder(r = xystageoffcenterholeradius, h = 2*z, $fa=1, $fs=0.5);
}

/////////////////////////////////////////////////////////////
/////////////////SHEET5 (lightfixture_bottom plate)//////////
////////////////////////////////////////////////////////////

difference ()
{

if ((LED_radius+2*radius_screws) > (x/prop+radius_screws+min_wallsize))
{ 
   $fn=50;
   color ("gold", a=1.0)
   translate ([0,0,light_height])
   hull()
   {
        translate ([-(LED_radius+2*radius_screws),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(LED_radius+2*radius_screws),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(LED_radius+2*radius_screws),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([-(LED_radius+2*radius_screws),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
    }
}
else {
//cube ([2*(x/prop+radius_screws+min_wallsize), 2*(x+radius_screws+min_wallsize),zLED], center = true);
   $fn=50;
   color ("gold", a=1.0)
   translate ([0,0,light_height])
   hull()
   {
        translate ([-(x/prop+radius_screws+min_wallsize),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(x/prop+radius_screws+min_wallsize),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(x/prop+radius_screws+min_wallsize),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([-(x/prop+radius_screws+min_wallsize),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
    }
}

//centerhole (for LED)
translate ([0, 0, (light_height)]) {
rotate([0, 0, 90])
cylinder(h = 2*zLED, r=LED_radius1, $fn=6,center = true);
}
//mounting holes for assembly
//top middle
translate ([0, (LED_radius+min_wallsize+radius_LEDscrews), (light_height-zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//bottom middle
translate ([0, -(LED_radius+min_wallsize+radius_LEDscrews), (light_height-zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//middle right
translate ([(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height-zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//middle left
translate ([-(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height-zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);

//screwholes for light-fixture
//top right
translate ([x/prop, x, (light_height-zLED)]) 
cylinder(r = radius_screws, h = 2*zLED, $fa=1, $fs=0.5);
//top left
translate ([-x/prop, x, (light_height-zLED)]) 
cylinder(r = radius_screws, h = 2*zLED, $fa=1, $fs=0.5);

}

/////////////////////////////////////////////////////////////
/////////////////SHEET6 (lightfixture_top plate)//////////
////////////////////////////////////////////////////////////

difference ()
{
if ((LED_radius+2*radius_screws) > (x/prop+radius_screws+min_wallsize))
{ 
   $fn=50;
   color ("yellow", a=1.0)
   translate ([0,0,light_height+zLED])
   hull()
   {
        translate ([-(LED_radius+2*radius_screws),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(LED_radius+2*radius_screws),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(LED_radius+2*radius_screws),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([-(LED_radius+2*radius_screws),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
    }
}
else {
   $fn=50;
   color ("yellow", a=1.0)
   translate ([0,0,light_height+zLED])
   hull()
   {
        translate ([-(x/prop+radius_screws+min_wallsize),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(x/prop+radius_screws+min_wallsize),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(x/prop+radius_screws+min_wallsize),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([-(x/prop+radius_screws+min_wallsize),x+radius_screws,0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
    }
}
//centerhole (for LED)
translate ([0, 0, (light_height+zLED)])
rotate([0, 0, 90])
cylinder(h = 2*zLED, r=LED_radius, $fn=6,center = true);

//mounting holes for assembly
//top right
translate ([x/prop, x, (light_height)]) 
cylinder(r = radius_screws, h = 2*zLED, $fa=1, $fs=0.5);
//top left
translate ([-x/prop, x, (light_height)]) 
cylinder(r = radius_screws, h = 2*zLED, $fa=1, $fs=0.5);

//holes for LED and lens fixtures
//top middle
translate ([0, (LED_radius+min_wallsize+radius_LEDscrews), (light_height)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//bottom middle
translate ([0, -(LED_radius+min_wallsize+radius_LEDscrews), (light_height)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//middle right
translate ([(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//middle left
translate ([-(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
}


/////////////////////////////////////////////////////////////
/////////////////SHEET7 (LED_holder upmost plate)//////////
////////////////////////////////////////////////////////////

difference ()
{

if ((LED_radius+2*radius_screws) > (x/prop+radius_screws+min_wallsize))
{ 
   $fn=50;
   color ("gold", a=1.0)
   translate ([0,0,light_height+3*zLED])
   hull()
   {
        translate ([-(LED_radius+2*radius_screws),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(LED_radius+2*radius_screws),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(LED_radius+2*radius_screws),(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([-(LED_radius+2*radius_screws),(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
    }
}
else {
   $fn=50;
   color ("gold", a=1.0)
   translate ([0,0,light_height+3*zLED])
   hull()
   {
        translate ([-(x/prop+radius_screws+min_wallsize),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(x/prop+radius_screws+min_wallsize),-(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([(x/prop+radius_screws+min_wallsize),(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
        translate ([-(x/prop+radius_screws+min_wallsize),(LED_radius+2*radius_screws),0])
        #cylinder(r = roundness_dia3, h = zLED, $fa=1, $fs=0.5, center = true);
    }
}



//centerhole (M3) to hold LED in place
translate ([0, 0, (light_height+2*zLED)])
cylinder(r = (radius_LEDscrews), h = 2*zLED, $fa=1, $fs=0.5);


//holes for LED and lens fixtures
//top middle
translate ([0, (LED_radius+min_wallsize+radius_LEDscrews), (light_height+2*zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//bottom middle
translate ([0, -(LED_radius+min_wallsize+radius_LEDscrews), (light_height+2*zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//middle right
translate ([(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height+2*zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
//middle left
translate ([-(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height+2*zLED)])
cylinder(r = radius_LEDscrews, h = 2*zLED, $fa=1, $fs=0.5);
}


////////////////////////////
////////////////////////////
// Just for illustration ///
////////////////////////////
////////////////////////////
/////HARDWARE///////////////
////////////////////////////
////////////////////////////

///////////////////
//Bottom Screws
//top right
color ("silver", a=1.0)
translate ([x, x, -5*z]) 
cylinder(r = radius_screws, h = 16*z, $fa=1, $fs=0.5, center = true);
//top left
color ("silver", a=1.0)
translate ([-x, x, -5*z]) 
cylinder(r = radius_screws, h = 16*z, $fa=1, $fs=0.5, center = true);
//bottom right
color ("silver", a=1.0)
translate ([x, -x, -5*z]) 
cylinder(r = radius_screws, h = 16*z, $fa=1, $fs=0.5, center = true);
//bottom left
color ("silver", a=1.0)
translate ([-x, -x, -5*z]) 
cylinder(r = radius_screws, h = 16*z, $fa=1, $fs=0.5, center = true);

///////////////////////////
//screws for light-fixture
//top right
color ("silver", a=1.0)
translate ([x/prop, x, -z]) 
cylinder(r = radius_screws, h = (4*zLED+light_height), $fa=1, $fs=0.5);
//top left
color ("silver", a=1.0)
translate ([-x/prop, x, -z]) 
cylinder(r = radius_screws, h = (4*zLED+light_height), $fa=1, $fs=0.5);

///////////////////
//magnets and steelbar-inserts

//bottom right_magnet
color ("silver", a=1.0)
translate ([y, -y, z]) 
rotate([0, 0, -90])
cylinder(h = z, r=radius_magnet, $fa=1, $fs=0.5,center = true);

//bottom left_magnet
color ("silver", a=1.0)
translate ([-y, -y, z]) 
rotate([0, 0, -90])
cylinder(h = z, r=radius_magnet, $fa=1, $fs=0.5,center = true);
//top middle_magnet
color ("silver", a=1.0)
translate ([0, y, z]) 
rotate([0, 0, 45])
cylinder(h = z, r=radius_magnet, $fa=1, $fs=0.5,center = true);
//top middle (steelbar-insert)
color ("silver", a=1.0)
translate ([0, y, z]) 
rotate([0, 0, 90])
cube ([2*radius_magnet+diameter_steelbar, 2*diameter_steelbar,z], center = true);
/////////////////////
//leadscrewnut
//top middle
color ("darkorange", a=1.0)
translate ([0, y, (stage_height-z)]) 
cylinder(r = radius_leadscrewnut, h = 3*z, $fa=1, $fs=0.5);
//top left
color ("darkorange", a=1.0)
translate ([-y, -y, (stage_height-z)]) 
cylinder(r = radius_leadscrewnut, h = 3*z, $fa=1, $fs=0.5);
//bottom right
color ("darkorange", a=1.0)
translate ([y, -y, (stage_height-z)]) 
cylinder(r = radius_leadscrewnut, h = 3*z, $fa=1, $fs=0.5);

/////////////////////
//leadscrews
//screw top middle
color ("slategray", a=1.0)
translate ([0, y, (1.5*z)]) 
cylinder(r = radius_leadscrew, h = 8*z, $fa=1, $fs=0.5);
//screw top left
color ("slategray", a=1.0)
translate ([-y, -y, (1.5*z)]) 
cylinder(r = radius_leadscrew, h = 8*z, $fa=1, $fs=0.5);
//screw bottom right
color ("slategray", a=1.0)
translate ([y, -y, (1.5*z)]) 
cylinder(r = radius_leadscrew, h = 8*z, $fa=1, $fs=0.5);

//hat top middle
color ("black", a=1.0)
translate ([0, y, (9.5*z)]) 
cylinder(r = radius_leadscrewnut, h = 2.5*z, $fa=1, $fs=0.5);
//hat top left
color ("black", a=1.0)
translate ([-y, -y, (9.5*z)]) 
cylinder(r = radius_leadscrewnut, h = 2.5*z, $fa=1, $fs=0.5);
//hat bottom right
color ("black", a=1.0)
translate ([y, -y, (9.5*z)]) 
cylinder(r = radius_leadscrewnut, h = 2.5*z, $fa=1, $fs=0.5);

//////////////////////
//light fixture-screws (M3)

//centerholescrew (fixes the LED in place and serves as heatsink)
color ("silver", a=1.0)
translate ([0, 0, (light_height+1*zLED)])
cylinder(r = (radius_LEDscrews), h = 4*zLED, $fa=1, $fs=0.5);


//////////////
//LED ('star' (hexagonal)-shaped)
union ()
{
color ("orangered", a=1.0)
translate ([0, 0, (light_height+0.5*zLED)])
rotate([0, 0, 90])
cylinder(h = zLED, r=LED_radius, $fn=6,center = true);

color ("orangered", a=1.0)
translate ([0, 0, (light_height-0.25*zLED)])
sphere (2.5);
}

//screws for LED and lens fixtures
//top middle
color ("silver", a=1.0)
translate ([0, (LED_radius+min_wallsize+radius_LEDscrews), (light_height-1.25*zLED)])
cylinder(r = radius_LEDscrews, h = 5.5*zLED, $fa=1, $fs=0.5);
//bottom middle
color ("silver", a=1.0)
translate ([0, -(LED_radius+min_wallsize+radius_LEDscrews), (light_height-1.25*zLED)])
cylinder(r = radius_LEDscrews, h = 5.5*zLED, $fa=1, $fs=0.5);
//middle right
color ("silver", a=1.0)
translate ([(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height-1.25*zLED)])
cylinder(r = radius_LEDscrews, h = 5.5*zLED, $fa=1, $fs=0.5);
//middle left
color ("silver", a=1.0)
translate ([-(LED_radius+min_wallsize+radius_LEDscrews), 0, (light_height-1.25*zLED)])
cylinder(r = radius_LEDscrews, h = 5.5*zLED, $fa=1, $fs=0.5);





