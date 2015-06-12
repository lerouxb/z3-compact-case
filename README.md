# z3-compact-case

A 3D printable case for a Sony Xperia Z3 Compact smartphone. See the [thing on
thingiverse](http://www.thingiverse.com/thing:714570) for photos.

I left the entire left side covered up, so you'll have to take the cover off to
plug it into a charger and if you actually have the charging dock you'll have
to make some modifications. Sorry!

The model is built in OpenSCAD and it is all parametric and well documented, so
it should be easy to modify or to use as the basis of a case for probably just
about any other smartphone.

My printer's nozzle is 0.4mm, so I made all the walls 0.8mm or 1.2mm - see the
top of the openscad file and configure to your liking.

At 0.8mm it might not be strong enough or your filament might actually be too
flexible, so you might want to go with 1.2mm, but then the power button is
unfortunately a bit recessed.

At first I tried to just have about 1.5cm of plastic in either direction on
every corner with the rest all cut away, but the corners kept breaking off and
eventually I gave up and left as much of the sides intact as possible. I also
bumped my printing temperature a bit higher than I usually print to try and
stop the layers from pulling apart when putting the case on or taking it off.

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

I printed this at 0.1mm layer height. 0.2mm should probably be fine too. It is
best to add support so that the four bridges come out perfect.

I ended up setting the infill to 0% because my printer was resonating like
crazy trying to infill a few microns here and there where it left little holes
between the layers. Some silly scaling maths that doesn't quite work out. I've
seen this happen while printing other phone covers too. Maybe it is a common
problem?

Anyway. Good luck!

