settings.outformat="pdf";
settings.prc = false; 
size(10cm);

import obj;
import components;
import connector;

Relay R1 = Relay((0,0), 180, "$R_1$");
R1.draw(showAnchor = true);

Node a = Node((-2,-2));
a.draw(red);
drawAnchorConnector(R1,0,a,0);
drawAnchorConnector(R1,1,a,1);
drawAnchorConnector(R1,2,a,2);
drawAnchorConnector(R1,3,a,3);