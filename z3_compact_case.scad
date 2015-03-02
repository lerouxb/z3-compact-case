$fn = 30;

// set this to some multiple of your nozzle width
shellWidth = 1.2;
wallWidth = shellWidth;

// actual dimensions
//length = 127;
//width = 64.9;
//depth = 8.4;

// tweaked larger a bit
length = 128.6;
width = 66;
depth = 9;

// we're trying to make it as big as the phone plus a wall all around
xscale = (length+2*wallWidth)/length;
yscale = (width+2*wallWidth)/width;
zscale = (depth+2*wallWidth)/depth;

// I'm really not sure about these. I tried to measure it with calipers and
// work it out, but it is tricky.
cornerRadius = 3.5;
edgeRadius = 7;

// how much to leave on the bottom around the edges. Trying to go as strong as
// possible without overlapping the camera lens.
edge = 8;

// how much to leave at the top and bottom corners
corner = 16;

// how much to leave above and below the cutouts
lip = 2;

// just for convenience
outsideLength = length*xscale;
outsideWidth = width*yscale;
outsideDepth = depth*zscale;

// bottom / base stuff
bottomCutoutLength = length - edge*2;
bottomCutoutWidth = width - edge*2;

// power+volume buttons
pLength = 30;
pWidth = 10;
pHeight = depth*zscale - (lip+wallWidth)*2;

// camera button
cOffset = 17 + wallWidth; // still not 100%
cLength = 10;
cWidth = 10;
cHeight = pHeight;


// a three dimensional rounded rectangle
module rounded(l, w, d, r) {
  // i for inner
  il = l - 2*r;
  iw = w - 2*r;

  //translate([-l/2, -w/2, 0])
  union() {
    translate([r, r, 0]) {
      translate([-r, 0, 0])
      cube([l, iw, d]);

      translate([0, -r, 0])
      cube([il, w, d]);

      cylinder(h=d, r=r);

      translate([il, iw, 0])
      cylinder(h=d, r=r);

      translate([0, iw, 0])
      cylinder(h=d, r=r);

      translate([il, 0, 0])
      cylinder(h=d, r=r);
    }
  }
}

module phone() {
  up = (edgeRadius*2+0.1)/2 - depth/2;
  translate([0, 0, -up])
  intersection() {
    translate([edgeRadius, edgeRadius, edgeRadius])
    minkowski() {
      //rounded(length-edgeRadius*2, width-edgeRadius*2, 0.1, cornerRadius);
      cube([length-edgeRadius*2, width-edgeRadius*2, 0.1]);
      sphere(edgeRadius);
    }
    // cut just the phone part out
    translate([0, 0, up])
    cube([length, width, depth]);
  }
}

module bottomCutout() {
  translate([edge+wallWidth, edge+wallWidth, -0.1])
  rounded(bottomCutoutLength, bottomCutoutWidth, wallWidth+1, cornerRadius);
}

module topCutout() {
  tLength = length*xscale+2*wallWidth;
  tWidth = width*yscale+2*wallWidth;
  translate([0, 0, (depth-wallWidth)*zscale-0.1])
  cube([tLength, tWidth, 10]);
}

module verticalCutout() {
  // (too many little things, so just make it symmetrical)
  vLength = length*xscale + 10;
  vWidth = width*yscale - 2*corner;
  vHeight = depth*zscale + 1;
  translate([0, corner, wallWidth + lip])
  cube([vLength, vWidth, vHeight]);
}

module powerCutout() {
  translate([outsideLength/2 - pLength/2, outsideWidth - pWidth/2, wallWidth+lip])
  cube([pLength, pWidth, pHeight]);
}

module cameraCutout() {
  translate([outsideLength - (cOffset+cLength), outsideWidth - cWidth/2, wallWidth+lip])
  cube([cLength, cWidth, cHeight]);
}

module cover() {
  difference() {
    // make the outer shell
    scale([xscale, yscale, zscale])
    phone();

    // cut out the inside
    translate([wallWidth, wallWidth, wallWidth])
    phone();

    // cut out the back side
    bottomCutout();

    // cut off the part above the screen
    topCutout();

    // cut out the vertical top+bottom
    verticalCutout();

    // cut out the power and volume buttons
    powerCutout();

    // cut out the camera button
    cameraCutout();

    // cut out the left+right
    /*
    // (this was from when I wanted to do the same as for top+bottom)
    hLength = length*xscale - 2*corner;
    hWidth = width*yscale + 10;
    hHeight = depth*zscale + 1;
    translate([corner, 0, wallWidth + lip])
    cube([hLength, hWidth, hHeight]);
    */
  }
}

translate([-length*xscale/2, -width*yscale/2, 0])
cover();
//phone();
