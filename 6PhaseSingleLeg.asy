settings.outformat="pdf";
settings.prc = false; 
size(10cm);

import obj;
import components;
import connector;

Igbt Q1 = Igbt((0,0), "$Q_1$");
Q1.draw();
Igbt Q2 = Igbt((0,-1), "$Q_2$");
Q2.draw();

Node g1 = Node(GetAnchorPos(Q1,0), "$g_{Q1}$", align = W);
g1.draw();
Node g2 = Node(GetAnchorPos(Q2,0), "$g_{Q2}$", align = W);
g2.draw();

Fuse F1 = Fuse(GetAnchorPos(Q1, 1), 90, "$F_1$");
F1.draw();

Node vbus = Node(GetAnchorPos(F1, 1),"$V_{bus}$", align = N);
vbus.draw();

Node gnd = Node(GetAnchorPos(Q2, 2) - (0,.5),"$gnd$", align = S);
gnd.draw();
drawAnchorConnector(Q2,2,gnd,0);

Inductor L1 = Inductor(GetAnchorPos(Q1,2) + (2.5,0) , 0,"$Motor_{ph}$");
L1.draw();

Node out = Node(GetAnchorPos(Q1,2));
out.draw();

Relay R1 = Relay(GetAnchorPos(out,1) + (1,-.4), 0, "$R_1$");
R1.draw();

drawAnchorConnector(out,DE-1,R1,2);
drawAnchorConnector(R1, 3, L1, 0);

Node Vr = Node(GetAnchorPos(R1, 0) - (.3, 0),"$V_R$", align = W);
Vr.draw();

Mos Q3 = Mos(GetAnchorPos(R1, 1) + (-.2,-1),"$Q_3$");
Q3.draw();

drawAnchorConnector(R1, 1, Q3, 1);

Diode D3 = Diode(GetAnchorPos(R1, 1) - (0,.3), 180,"$D_3$");
D3.draw();

drawAnchorConnector(Vr,DE-1,R1,0,0.05);

int idx1 = AddAnchorPoint(R1,GetAnchorPos(R1, 0),DS);
int idx2 = AddAnchorPoint(D3,GetAnchorPos(D3, 1),DN);
drawAnchorConnector(R1,idx1,D3,idx2, 0.05, drawNode1 = true);
idx1 = AddAnchorPoint(R1,GetAnchorPos(R1, 1),DS);
idx2 = AddAnchorPoint(D3,GetAnchorPos(D3, 0),DN);
drawAnchorConnector(R1,idx1,D3,idx2, 0.05, drawNode1 = true);