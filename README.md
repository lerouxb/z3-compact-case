# z3-compact-case

A 3D printable case for a Sony Xperia Z3 Compact smartphone. See the [thing on
thingiverse](http://www.thingiverse.com/thing:714570) for photos.

I left the entire left side covered up, so you'll have to take the cover off to
plug it into a charger and if you actually have the charging dock you'll have
to make some modifications. Sorry!

The model is built in OpenSCAD and it is all parametric and well documented, so
it should be easy to modify or to use as the basis of a case for probably just
about any other smartphone.

My printer's nozzle is 0.4mm, so I made all the walls 0.8mm, which is 2 layers
thick. I had some problems with things snapping when printed with cheap PLA
early on, so you might have to make that thicker, but then the power button
might be a bit too recessed. If you're printing with strong plastic, you should
be able to get away with just two layers. If you have a different nozzle size
you might want to adjust the wall width in the model accordingly.

I made the borders on the bottom rather wide too. All of this was in an effort
to get it as strong as possible. At first I tried to just have about 1.5cm of
plastic in either direction on every corner with the rest all cut away, but the
corners kept breaking off and eventually I gave up and left as much of the
sides intact as possible. I also bumped my printing temperature a bit higher
than I usually print to try and stop the layers from pulling apart when putting
the case on or taking it off.

Warping shouldn't be much of an issue, because there's relatively little in
contact with the print bed and lots of space for things to stretch/contract
into.

# Build Instructions

Use OpenSCAD to turn this into an STL file, then use your favourite slicer to
turn that into GCODE and then whatever is your preferred method to feed that to
your 3D printer.

# Assembly and Usage

The phone's dimensions had to be fudged a bit in the model to get things to fit
on my phone after printing with my printer, but I left the actual dimensions
commented in there, so you can tweak things a bit if you have to. I'm still not
100% sure about the curves on the sides and on the corners. I arrived at this
mostly by eyeballing it and through trial and error. If anyone has more exact
values, please send me a pull request!

I printed this at 0.1mm layer height. 0.2mm should probably be fine too. There
are two bridges, but miraculously they never gave me any trouble yet.

I ended up setting the infill to 0% because my printer was resonating like
crazy trying to infill a few microns here and there where it left little holes
between the layers. Some silly scaling maths that doesn't quite work out. I've
seen this happen while printing other phone covers too. Maybe it is a common
problem?

Anyway. Good luck!

