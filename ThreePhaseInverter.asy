settings.outformat="pdf";
settings.render = 16;
settings.prc = false; 
size(16cm);

import obj;
import components;
import connector;

string[] phaseName = {"A", "B", "C"};

Obj[] drawLeg(pair origin, int phase) {

  string HS = (string)((phase * 2) + 1);
  string LS = (string)((phase * 2) + 2);

  Igbt Q1 = Igbt(origin, "$Q_" + HS + "$");
  Q1.draw();
  Igbt Q2 = Igbt(origin + (0,-1.4), "$Q_" + LS + "$");
  Q2.draw();

  Node g1 = Node(GetAnchorPos(Q1,0), "$g_{Q" + HS + "}$", align = W);
  g1.draw(smallDot);
  Node g2 = Node(GetAnchorPos(Q2,0), "$g_{Q" + LS + "}$", align = W);
  g2.draw(smallDot);

  Diode D1 = Diode(GetAnchorPos(Q1,2) + (0.3,0), 90, "$D_" + HS + "$");
  D1.draw();
  Diode D2 = Diode(GetAnchorPos(Q2,2) + (0.3,0), 90, "$D_" + LS + "$");
  D2.draw();

  ConnectParallel(Q1,2,1,D1,0,1,DE);
  ConnectParallel(Q2,2,1,D2,0,1,DE);

  Node out = Node(GetAnchorPos(Q1,2) - (0,.2));
  out.draw();

  drawAnchorConnector(Q1, 2, out, DN-1);
  drawAnchorConnector(Q2, 1, out, DS-1);

  Inductor L1 = Inductor(GetAnchorPos(out,0) + (.6,-.1), -90,"$Ph_{" + phaseName[phase] + "}$");
  L1.draw();

  drawAnchorConnector(out, DE-1, L1, 0);

  Obj[] retVal;
  retVal[0] = Node(GetAnchorPos(Q1, 1),"");
  retVal[1] = Node(GetAnchorPos(Q2, 2),"");
  retVal[2] = out;
  return retVal;
}

Obj[] refObj = drawLeg((0,0),0);
Obj N1 = refObj[0];
Obj N2 = refObj[1];
Obj out = refObj[2];

Node N1a = Node(N1.pos + (0,0.2));
N1a.draw();
Node N2a = Node(N2.pos + (0,-0.2));
N2a.draw();

Node vbus = Node(N1.pos + (0,.4),"$V_{bus}$", align = NE);
vbus.draw();

GndPower gndP = GndPower(N2.pos - (0,.5), 0, "");
gndP.draw();
drawAnchorConnector(N2,1,gndP,0);

Obj[] refObj1 = drawLeg((2,0),1);
Obj N3 = refObj1[0];
Obj N4 = refObj1[1];

Node N3a = Node(N3.pos + (0,0.2));
N3a.draw();
Node N4a = Node(N4.pos + (0,-0.2));
N4a.draw();

drawAnchorConnector(N1,0,N3,0, r1 = 0.2);
drawAnchorConnector(N2,1,N4,1, r1 = 0.2);

Obj[] refObj2 = drawLeg((4,0),2);
Obj N5 = refObj2[0];
Obj N6 = refObj2[1];

Node N5a = Node(N5.pos + (0,0.2));
N5a.draw();
Node N6a = Node(N6.pos + (0,-0.2));
N6a.draw();

drawAnchorConnector(N3,0,N5,0, r1 = 0.2);
drawAnchorConnector(N4,1,N6,1, r1 = 0.2);

Capacitor cap = Capacitor(GetAnchorPos(out,0) + (5.5,0.5), -90, "$C_{BUS}$" );
cap.draw();

drawAnchorConnector(N5, 0, cap, 0, r1 = 0.2);
drawAnchorConnector(N6, 1, cap, 1, r1 = 0.2);

drawAnchorConnector(vbus, 1, N1, 0);