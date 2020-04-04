import obj;
import connector;

settings.outformat="pdf";
settings.prc = false; 
size(6cm);

Anchor[] alist;
Obj[] oList;
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
}

// Test with different orientation
void testW_NS() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DS-1);
  shipout("0W-1S");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DN-1);
  shipout("0W-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DS-1);
  shipout("0W-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DN-1);
  shipout("0W-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DS-1);
  shipout("0W-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DN-1);
  shipout("0W-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DS-1);
  shipout("0W-4S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DN-1);
  shipout("0W-4N");
  erase();}

void testE_NS() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DS-1);
  shipout("0E-1S");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DN-1);
  shipout("0E-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DS-1);
  shipout("0E-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DN-1);
  shipout("0E-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DS-1);
  shipout("0E-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DN-1);
  shipout("0E-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DS-1);
  shipout("0E-4S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DN-1);
  shipout("0E-4N");
  erase();}

void testN_EW() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DE-1);
  shipout("0N-1E");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DW-1);
  shipout("0N-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DE-1);
  shipout("0N-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DW-1);
  shipout("0N-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DE-1);
  shipout("0N-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DW-1);
  shipout("0N-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DE-1);
  shipout("0N-4E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DW-1);
  shipout("0N-4W");
  erase();}

void testS_EW() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DE-1);
  shipout("0S-1E");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DW-1);
  shipout("0S-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DE-1);
  shipout("0S-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DW-1);
  shipout("0S-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DE-1);
  shipout("0S-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DW-1);
  shipout("0S-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DE-1);
  shipout("0S-4E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DW-1);
  shipout("0S-4W");
  erase();}

// Test with same direction
void testW_W() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DW-1);
  shipout("0W-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DW-1);
  shipout("0W-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DW-1);
  shipout("0W-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DW-1);
  shipout("0W-4W");
  erase();}
void testE_E() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DE-1);
  shipout("0E-1E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DE-1);
  shipout("0E-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DE-1);
  shipout("0E-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DE-1);
  shipout("0E-4E");
  erase();}
void testN_N() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DN-1);
  shipout("0N-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DN-1);
  shipout("0N-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DN-1);
  shipout("0N-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DN-1);
  shipout("0N-4N");
  erase();}
void testS_S() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DS-1);
  shipout("0S-1S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DS-1);
  shipout("0S-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DS-1);
  shipout("0S-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DS-1);
  shipout("0S-4S");
  erase();}

// Test with oposite direction
void testW_E() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DE-1);
  shipout("0W-1E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DE-1);
  shipout("0W-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DE-1);
  shipout("0W-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DE-1);
  shipout("0W-4E");
  erase();}

void testE_W() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DW-1);
  shipout("0E-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DW-1);
  shipout("0E-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DW-1);
  shipout("0E-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DW-1);
  shipout("0E-4W");
  erase();}

void testN_S() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DS-1);
  shipout("0N-1S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DS-1);
  shipout("0N-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DS-1);
  shipout("0N-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DS-1);
  shipout("0N-4S");
  erase();}

void testS_N() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DN-1);
  shipout("0S-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DN-1);
  shipout("0S-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DN-1);
  shipout("0S-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DN-1);
  shipout("0S-4N");
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