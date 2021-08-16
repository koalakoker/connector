import obj;
import connector;
import drawOptions;

settings.outformat="pdf";
settings.prc = false; 
size(12cm);

Anchor[] alist;
Obj[] oList;
path b;
real dsp = 7.0;
// Init
{
  Anchor a;

  pair[] aPos = {(0,.5), (0,-.5), (.5,0), (-.5,0)};
  int[]  aDir = {DN,     DS,      DE,     DW};

  for (int i = 0; i < aDir.length; i += 1) {
    a = Anchor(aPos[i], aDir[i]);
    alist.push(a);
  }

  Obj o;

  pair[]   oPos  = {(0,0), (2,2), (2,-2), (-2,-2), (-2,2)};
  string[] oName = {"o0" , "o1",  "o2",   "o3",    "o4"};

  for (int i = 0; i < oName.length; i += 1) {
    o = Obj(oPos[i], 1, oName[i]);
    o.a = alist;
    oList.push(o);
  }

  // Bounding box
  b = box((-3.5,-3.5),(3.5,3.5));
}

// Draw option
DrawOption dOpt = DrawOption(showBounds = true);

// Test with different orientation
void testW_NS() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[1], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[2], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[3], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[4], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("W-N");
  
  erase();
  
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[1], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}
  
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[2], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[3], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[4], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("W-S");
  
  erase();}

void testE_NS() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[1], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[2], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[3], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[4], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("E-N");
  
  erase();
  
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[1], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}
  
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[2], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[3], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[4], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("E-S");
  
  erase();}

void testN_EW() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[1], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}
    
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[2], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[3], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[4], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("N-E");
  
  erase();
  
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[1], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[2], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[3], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[4], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("N-W");
  
  erase();}

void testS_EW() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[1], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}
    
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[2], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[3], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[4], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("S-E");
  
  erase();

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[1], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[2], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[3], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[4], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("S-W");
  
  erase();}

// Test with same direction
void testW_W() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[1], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[2], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[3], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[4], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("W-W");
  
  erase();}
void testE_E() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[1], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[2], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[3], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[4], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("E-E");
  
  erase();}
void testN_N() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[1], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[2], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[3], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[4], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("N-N");
  
  erase();}
void testS_S() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[1], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[2], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[3], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[4], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("S-S");
  
  erase();}

// Test with oposite direction
void testW_E() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[1], DE-1, .5, .5, 1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[2], DE-1, .5, .5, 1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[3], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DW-1, oList[4], DE-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("W-E");
  
  erase();}

void testE_W() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[1], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[2], DW-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[3], DW-1, .5, .5, 1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DE-1, oList[4], DW-1, .5, .5, 1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("E-W");
  
  erase();}

void testN_S() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[1], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[2], DS-1, .5, .5, 1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[3], DS-1, .5, .5, 1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DN-1, oList[4], DS-1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("N-S");
  
  erase();}

void testS_N() {
  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[1], DN-1, 0.5, 0.5, 1);
  for (Obj o: oList) {o.pos = o.pos + (1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[2], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (0,1) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[3], DN-1);
  for (Obj o: oList) {o.pos = o.pos + (-1,0) * dsp;}

  for (Obj o: oList) {o.draw(dOpt);}
  drawAnchorConnector(oList[0], DS-1, oList[4], DN-1, 0.5, 0.5, 1);
  for (Obj o: oList) {o.pos = o.pos + (0,-1) * dsp;}
  
  draw(b);
  draw(shift((1,0) * dsp) * b);
  draw(shift((1,1) * dsp) * b);
  draw(shift((0,1) * dsp) * b);
  shipout("S-N");
  
  erase();}

testN_N();
testS_S();
testE_E();
testW_W();
testW_E();
testE_W();
testN_S();
testS_N();
testW_NS();
testE_NS();
testN_EW();
testS_EW();