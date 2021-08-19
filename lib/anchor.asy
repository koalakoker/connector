struct Anchor {
  pair pos;
  int dir;

  void operator init(pair pos, int dir) {
    this.pos = pos;
    this.dir = dir;
  }
}

int DN = 1;
int DS = 2;
int DE = 3;
int DW = 4;
int DH = 10;
int DV = 11;

real anchorLength = 0.2;
pair[] EndPointDelta = {(0,0), 
                        (0, anchorLength),  // DN
                        (0,-anchorLength),  // DS
                        (anchorLength, 0),  // DE
                        (-anchorLength,0)}; // DW

align[] LabelAlign = { NoAlign, NE, SE, NE, NW };


int getOrientation(int dir) {
  int retVal = 0;
  if ((dir == DN) || (dir == DS)) {
    retVal = DV;
  }
  if ((dir == DE) || (dir == DW)) {
    retVal = DH;
  }
  return retVal;
}

bool sameOrientation(int dir1, int dir2) {
  bool retVal = false;
  if (getOrientation(dir1) == getOrientation(dir2)) {
    retVal = true;
  }
  return retVal;
}

bool sameDirection(int dir1, int dir2) {
  bool retVal = false;
  if (dir1 == dir2) {
    retVal = true;
  }
  return retVal;
}

int rotateDir(int dir, int angle) {
  int retVal = dir;
  if (angle == 90) {
    if (dir == DN) {
      retVal = DW;
    }
    if (dir == DW) {
      retVal = DS;
    }
    if (dir == DS) {
      retVal = DE;
    }
    if (dir == DE) {
      retVal = DN;
    }
  }
  if (angle == -90) {
    if (dir == DN) {
      retVal = DE;
    }
    if (dir == DE) {
      retVal = DS;
    }
    if (dir == DS) {
      retVal = DW;
    }
    if (dir == DW) {
      retVal = DN;
    }
  }
  if ((angle == 180) || (angle == -180)) {
    if (dir == DN) {
      retVal = DS;
    }
    if (dir == DW) {
      retVal = DE;
    }
    if (dir == DS) {
      retVal = DN;
    }
    if (dir == DE) {
      retVal = DW;
    }
  }
  return retVal;
}