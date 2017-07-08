
static class Pseudoangle {

  static float get(float dx, float dy) {
    final float adx = abs(dx);
    final float ady = abs(dy);

    int code = (adx < ady) ? 1 : 0;
    if (dx < 0)  code += 2;
    if (dy < 0)  code += 4;

    switch (code) {
    case 0://[  0, 45]
      return (dx==0)? 0:ady/adx;
    case 1://( 45, 90]
      return (2.0 - (adx/ady));
    case 3://( 90,135)
      return (2.0 + (adx/ady));
    case 2://[135,180]
      return (4.0 - (ady/adx));
    case 6://(180,225]
      return (4.0 + (ady/adx));
    case 7://(225,270)
      return (6.0 - (adx/ady));
    case 5://[270,315)
      return (6.0 + (adx/ady));
    default: //case 4 - [315,360)
      return (8.0 - (ady/adx));
    }
  }
}