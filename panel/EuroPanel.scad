
EuroPanel("EG140", 6);

module EuroPanel(label, hp=8) {
    
    sideOffset = 5;
    panelWidth = hp*5.08;

    translate([0,118.5,2]) scale([.75,1,1]) rotate([90,0,0]) Support();
    translate([panelWidth,118.5,2]) scale([-.75,1,1]) rotate([90,0,0]) Support();
    
    difference() {
        cube([hp*5.08, 128.5, 2]);

        translate([1.4,15,1]) rotate([180,0,0])  {
            linear_extrude(height=2, convexity=4) text(label, size=6.5);
        }    

        translate([7.5,3]) MountingHole();
        translate([panelWidth - 7.5, 128.5 - 3]) MountingHole();

        translate ([panelWidth - sideOffset, 27, 0]) union() {
            KnobHole();
            translate([0,19,0]) KnobHole();
            translate([0,38,0]) KnobHole();
            translate([0,57,0]) KnobHole();
            translate([0,73,0]) LEDHole();
            translate([0,84,0]) JackHole();
        }

    }
        
    color("green", .3)
        translate([panelWidth - sideOffset, 14.25,2])
            cube([1,100,50]);
}

module KnobHole() { translate([-12.5,0,-.5]) cylinder(h=3, d=8, $fn=12); }

module JackHole() { translate([-6,0,-.5]) cylinder(h=3, d=6.3, $fn=12); }

module LEDHole() { translate([-10,0,-.5]) cylinder(h=3, d=5.1, $fn=12); }

module Support() { 
    linear_extrude(108.5) 
        polygon([[0,0], [0,2], [2,6], [4,6], [4,0]]);
}


module MountingHole() {
    hull() {
        translate([-2,0,-.5]) cylinder(h=3, r=1.5, $fn=12);
        translate([2,0,-.5]) cylinder(h=3, r=1.5, $fn=12);
    }
}

echo(version=version());
