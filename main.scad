use </catchnhole/catchnhole.scad>;

$fn = 50;

union () {
    scale([1.125, 1.125, 1]) {
      // An M4 hole with a countersunk screw:
      bolt("M4", 12, kind = "countersunk");
    }
}
