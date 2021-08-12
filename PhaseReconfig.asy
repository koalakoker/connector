//settings.outformat="pdf";
settings.outformat="png";
settings.render = 16;
settings.prc = false; 
size(10cm);

import obj;
import components;
import connector;

/////////////////////////////////////
//            First leg            //
/////////////////////////////////////
Igbt Q1 = Igbt((0,0), "$Q_1$");
Q1.draw();
Igbt Q2 = Igbt((0,-1.4), "$Q_2$");
Q2.draw();

Node o1 = Node(GetAnchorPos(Q1,2) - (0,.2));
o1.draw();
drawAnchorConnector(Q1, 2, o1, DN-1);
drawAnchorConnector(Q2, 1, o1, DS-1);

RelaySPDT R1 = RelaySPDT(GetAnchorPos(o1,2) + (1,-.4), 0, "$R_1$");
R1.draw();
drawAnchorConnector(o1,DE-1,R1,2);

Node Vr = Node(GetAnchorPos(R1, 0) - (.3, 0), "$V_R$", align = W);
Vr.draw();
drawAnchorConnector(Vr,DE-1,R1,0,0.05);

Inductor L1 = Inductor(GetAnchorPos(R1,3) + (.3,0), 0,"$Motor_{ph1}$");
L1.draw();
drawAnchorConnector(R1, 3, L1, 0);

////////////////////////////////////
//           Second leg           //
////////////////////////////////////
Igbt Q3 = Igbt((0,-2.5), "$Q_3$");
Q3.draw();
Igbt Q4 = Igbt((0,-3.9), "$Q_4$");
Q4.draw();

Node o2 = Node(GetAnchorPos(Q3,2) - (0,.2));
o2.draw();
drawAnchorConnector(Q3, 2, o2, DN-1);
drawAnchorConnector(Q4, 1, o2, DS-1);

RelaySPDT R2 = RelaySPDT(GetAnchorPos(o2,2) + (1,-.4), 0, "$R_2$");
R2.draw();
drawAnchorConnector(o2,DE-1,R2,2);

Node Vr2 = Node(GetAnchorPos(R2, 0) - (.3, 0), "$V_R$", align = W);
Vr2.draw();
drawAnchorConnector(Vr2,DE-1,R2,0,0.05);

Inductor L2 = Inductor(GetAnchorPos(R2,3) + (.3,0), 0,"$Motor_{ph2}$");
L2.draw();
drawAnchorConnector(R2, 3, L2, 0);

/////////////////////////////////////
//             Aux leg             //
/////////////////////////////////////
Igbt Q5 = Igbt((4.5,-1.3), "$Q_5$");
Q5.draw();
Igbt Q6 = Igbt((4.5,-2.7), "$Q_6$");
Q6.draw();

Node o3 = Node(GetAnchorPos(Q5,2) - (0,.2));
o3.draw();
drawAnchorConnector(Q5, 2, o3, DN-1);
drawAnchorConnector(Q6, 1, o3, DS-1);

Node o4 = Node(GetAnchorPos(o3,0) - (.8,0));
o4.draw();
drawAnchorConnector(o4, DE-1, o3, DW-1);
drawAnchorConnector(R2, 4, o4, DW-1);

Node o5 = Node(GetAnchorPos(o4,0) + (0,2));
//o5.draw();
drawAnchorConnector(o5, DS-1, o4, DN-1);
drawAnchorConnector(R1, 4, o5, DW-1);