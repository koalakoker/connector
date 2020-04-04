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