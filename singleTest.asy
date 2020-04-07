settings.outformat="pdf";
settings.prc = false; 
size(10cm);

import obj;
import components;
import connector;

// Igbt I1 = Igbt((0,0), "$Q_1$");
// I1.draw();
// Igbt I2 = Igbt((0,-1), "$Q_2$");
// I2.draw();

// Igbt I3 = Igbt((1.5,0), "$Q_3$");
// I3.draw();
// Igbt I4 = Igbt((1.5,-1), "$Q_4$");
// I4.draw();

// Igbt I5 = Igbt((3,0), "$Q_5$");
// I5.draw();
// Igbt I6 = Igbt((3,-1), "$Q_6$");
// I6.draw();

// Resistor r1 = Resistor((0  ,-2.5), "$R_1$"  , orient = 90);
// r1.draw();
// Resistor r2 = Resistor((1.5,-2.5), "$R_2$", orient = 90);
// r2.draw();
// Resistor r3 = Resistor((3  ,-2.5), "$R_3$"  , orient = 90);
// r3.draw();

// Node vbus = Node(I3.obj.getAnchorPos(1) + (0,.1),"$V_{bus}$", align = N);
// vbus.draw();

// Node gnd = Node(r2.obj.getAnchorPos(1) + (0,-.1),"$gnd$", align = S);
// gnd.draw();

// drawAncorConnector(I1,1, I3, 1, 0.1, arrow = None);
// drawAncorConnector(I3,1, I5, 1, 0.1, arrow = None);
// drawAncorConnector(r1,1, r2, 1, 0.1, arrow = None);
// drawAncorConnector(r2,1, r3, 1, 0.1, arrow = None);

//Resistor R1 = Resistor((0,0), 0,"$R_1$");
//R1.draw();
//Resistor R2 = Resistor((0,0), 90,"$R_2$");
//R2.draw();
//Resistor R3 = Resistor((0,0), -90,"$R_3$");
//R3.draw();

//Inductor L1 = Inductor((0,0), 0,"$L_1$");
//L1.draw();
//Inductor L2 = Inductor((0,0), 90,"$L_2$");
//L2.draw();
//Inductor L3 = Inductor((0,0), -90,"$L_3$");
//L3.draw();

//Capacitor C1 = Capacitor((0,0), 0, "$C_1$");
//C1.draw();
//Capacitor C2 = Capacitor((0,0), 90, "$C_2$");
//C2.draw();
//Capacitor C3 = Capacitor((0,0), -90, "$C_3$");
//C3.draw();

//Fuse F1 = Fuse((0,0), 0, "$F_1$");
//F1.draw(showAnchor = true);
//Fuse F2 = Fuse((0,0), 90, "$F_2$");
//F2.draw(showAnchor = true);
//Fuse F3 = Fuse((0,0), -90, "$F_3$");
//F3.draw(showAnchor = true);

Relay R1 = Relay((0,0), 180, "$R_1$");
R1.draw(showAnchor = true);
// Relay R2 = Relay((0,0), 90, "$R_2$");
// R2.draw(showAnchor = true);
// Relay R3 = Relay((0,0), -90, "$R_3$");
// R3.draw(showAnchor = true);
//Relay R4 = Relay((0,0), 180, "$R_4$");
//R4.draw(showAnchor = true);

Node a = Node((-2,-2));
a.draw(red);
drawAncorConnector(R1,0,a,0);
drawAncorConnector(R1,1,a,1);
drawAncorConnector(R1,2,a,2);
drawAncorConnector(R1,3,a,3);