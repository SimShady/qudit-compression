OPENQASM 2.0;
include "qelib1.inc";
qreg q[14];
qreg psi[1];
creg c[14];
u3(pi,-1.3465475,-pi) psi[0];
cz psi[0],q[0];
u3(1.3465475,-pi/2,pi/2) q[0];
cz psi[0],q[0];
u1(1.1222987) psi[0];
cz psi[0],q[1];
u2(-1.3465475,-pi) q[0];
u3(0.44849764,pi/2,-pi/2) q[1];
cz psi[0],q[1];
cz psi[0],q[2];
u2(0.44849763,-pi) q[1];
u3(0.89699525,pi/2,-pi/2) q[2];
cz psi[0],q[2];
cz psi[0],q[3];
u2(0.89699525,-pi) q[2];
u3(1.3476021,-pi/2,pi/2) q[3];
cz psi[0],q[3];
cz psi[0],q[4];
u2(-1.3476021,-pi) q[3];
u3(0.44638841,pi/2,-pi/2) q[4];
cz psi[0],q[4];
cz psi[0],q[5];
u2(0.44638841,-pi) q[4];
u3(0.8927768,pi/2,-pi/2) q[5];
cz psi[0],q[5];
cz psi[0],q[6];
u2(0.8927768,-pi) q[5];
u3(1.356039,-pi/2,pi/2) q[6];
cz psi[0],q[6];
cz psi[0],q[7];
u2(-1.356039,-pi) q[6];
u3(0.42951462,pi/2,-pi/2) q[7];
cz psi[0],q[7];
cz psi[0],q[8];
u3(0.42951462,-pi/2,pi/2) q[7];
cz q[6],q[7];
u2(0,pi) q[6];
u2(0,pi) q[7];
cz q[7],q[6];
u2(0,pi) q[6];
u2(0,pi) q[7];
cz q[6],q[7];
u1(-1.5462526) q[6];
u2(-pi/256,-pi) q[7];
u3(0.85902925,pi/2,-pi/2) q[8];
cz psi[0],q[8];
cz psi[0],q[9];
u3(0.85902925,-pi/2,pi/2) q[8];
cz q[5],q[8];
u2(0,pi) q[5];
u2(0,pi) q[8];
cz q[8],q[5];
u2(0,pi) q[5];
u2(0,pi) q[8];
cz q[5],q[8];
u1(-1.5217089) q[5];
u2(-pi/512,-pi) q[8];
u3(1.4235341,-pi/2,pi/2) q[9];
cz psi[0],q[9];
cz psi[0],q[10];
u3(0.29452431,pi/2,-pi/2) q[10];
cz psi[0],q[10];
cz psi[0],q[11];
u3(0.29452431,-pi/2,pi/2) q[10];
u3(3*pi/16,pi/2,-pi/2) q[11];
cz psi[0],q[11];
cz psi[0],q[12];
u3(3*pi/16,-pi/2,pi/2) q[11];
u3(3*pi/8,pi/2,-pi/2) q[12];
cz psi[0],q[12];
cz psi[0],q[13];
u3(3*pi/8,-pi/2,pi/2) q[12];
cz q[1],q[12];
u2(0,pi) q[1];
u2(0,pi) q[12];
cz q[12],q[1];
u2(0,pi) q[1];
u2(0,pi) q[12];
cz q[1],q[12];
u1(-pi/4) q[1];
u2(-pi/8192,-pi) q[12];
u3(pi/4,-pi/2,pi/2) q[13];
cz psi[0],q[13];
u3(pi/4,pi/2,-pi/2) q[13];
cz q[0],q[13];
u2(0,pi) q[0];
u2(0,pi) q[13];
cz q[13],q[0];
u2(0,pi) q[0];
u2(0,pi) q[13];
cz q[0],q[13];
cz q[1],q[0];
u3(pi/4,-pi/2,pi/2) q[0];
cz q[1],q[0];
u3(pi/4,pi/2,-pi/2) q[0];
u2(-pi/16384,-pi) q[13];
cz q[2],q[11];
u2(0,pi) q[11];
u2(0,pi) q[2];
cz q[11],q[2];
u2(0,pi) q[11];
u2(0,pi) q[2];
cz q[2],q[11];
u2(-pi/4096,-pi) q[11];
u1(-3*pi/8) q[2];
cz q[2],q[0];
u3(pi/8,-pi/2,pi/2) q[0];
cz q[2],q[0];
u3(pi/8,pi/2,-pi/2) q[0];
cz q[2],q[1];
u3(pi/4,-pi/2,pi/2) q[1];
cz q[2],q[1];
u3(pi/4,pi/2,-pi/2) q[1];
cz q[3],q[10];
u2(0,pi) q[10];
u2(0,pi) q[3];
cz q[10],q[3];
u2(0,pi) q[10];
u2(0,pi) q[3];
cz q[3],q[10];
u2(-pi/2048,-pi) q[10];
u1(-7*pi/16) q[3];
cz q[3],q[0];
u3(pi/16,-pi/2,pi/2) q[0];
cz q[3],q[0];
u3(pi/16,pi/2,-pi/2) q[0];
cz q[3],q[1];
u3(pi/8,-pi/2,pi/2) q[1];
cz q[3],q[1];
u3(pi/8,pi/2,-pi/2) q[1];
cz q[3],q[2];
u3(pi/4,-pi/2,pi/2) q[2];
cz q[3],q[2];
u3(pi/4,pi/2,-pi/2) q[2];
u3(1.4235342,pi/2,-pi/2) q[9];
cz q[4],q[9];
u2(0,pi) q[4];
u2(0,pi) q[9];
cz q[9],q[4];
u2(0,pi) q[4];
u2(0,pi) q[9];
cz q[4],q[9];
u1(-1.4726216) q[4];
cz q[4],q[0];
u3(pi/32,-pi/2,pi/2) q[0];
cz q[4],q[0];
u3(pi/32,pi/2,-pi/2) q[0];
cz q[4],q[1];
u3(pi/16,-pi/2,pi/2) q[1];
cz q[4],q[1];
u3(pi/16,pi/2,-pi/2) q[1];
cz q[4],q[2];
u3(pi/8,-pi/2,pi/2) q[2];
cz q[4],q[2];
u3(pi/8,pi/2,-pi/2) q[2];
cz q[4],q[3];
u3(pi/4,-pi/2,pi/2) q[3];
cz q[4],q[3];
u3(pi/4,pi/2,-pi/2) q[3];
cz q[5],q[0];
u3(pi/64,-pi/2,pi/2) q[0];
cz q[5],q[0];
u3(pi/64,pi/2,-pi/2) q[0];
cz q[5],q[1];
u3(pi/32,-pi/2,pi/2) q[1];
cz q[5],q[1];
u3(pi/32,pi/2,-pi/2) q[1];
cz q[5],q[2];
u3(pi/16,-pi/2,pi/2) q[2];
cz q[5],q[2];
u3(pi/16,pi/2,-pi/2) q[2];
cz q[5],q[3];
u3(pi/8,-pi/2,pi/2) q[3];
cz q[5],q[3];
u3(pi/8,pi/2,-pi/2) q[3];
cz q[5],q[4];
u3(pi/4,-pi/2,pi/2) q[4];
cz q[5],q[4];
u3(pi/4,pi/2,-pi/2) q[4];
cz q[6],q[0];
u3(pi/128,-pi/2,pi/2) q[0];
cz q[6],q[0];
u3(pi/128,pi/2,-pi/2) q[0];
cz q[6],q[1];
u3(pi/64,-pi/2,pi/2) q[1];
cz q[6],q[1];
u3(pi/64,pi/2,-pi/2) q[1];
cz q[6],q[2];
u3(pi/32,-pi/2,pi/2) q[2];
cz q[6],q[2];
u3(pi/32,pi/2,-pi/2) q[2];
cz q[6],q[3];
u3(pi/16,-pi/2,pi/2) q[3];
cz q[6],q[3];
u3(pi/16,pi/2,-pi/2) q[3];
cz q[6],q[4];
u3(pi/8,-pi/2,pi/2) q[4];
cz q[6],q[4];
u3(pi/8,pi/2,-pi/2) q[4];
cz q[6],q[5];
u3(pi/4,-pi/2,pi/2) q[5];
cz q[6],q[5];
u3(pi/4,pi/2,-pi/2) q[5];
cz q[7],q[0];
u3(pi/256,-pi/2,pi/2) q[0];
cz q[7],q[0];
u3(pi/256,pi/2,-pi/2) q[0];
u1(-1.5462526) q[7];
cz q[7],q[1];
u3(pi/128,-pi/2,pi/2) q[1];
cz q[7],q[1];
u3(pi/128,pi/2,-pi/2) q[1];
cz q[7],q[2];
u3(pi/64,-pi/2,pi/2) q[2];
cz q[7],q[2];
u3(pi/64,pi/2,-pi/2) q[2];
cz q[7],q[3];
u3(pi/32,-pi/2,pi/2) q[3];
cz q[7],q[3];
u3(pi/32,pi/2,-pi/2) q[3];
cz q[7],q[4];
u3(pi/16,-pi/2,pi/2) q[4];
cz q[7],q[4];
u3(pi/16,pi/2,-pi/2) q[4];
cz q[7],q[5];
u3(pi/8,-pi/2,pi/2) q[5];
cz q[7],q[5];
u3(pi/8,pi/2,-pi/2) q[5];
cz q[7],q[6];
u3(pi/4,-pi/2,pi/2) q[6];
cz q[7],q[6];
u3(pi/4,pi/2,-pi/2) q[6];
cz q[8],q[0];
u3(pi/512,-pi/2,pi/2) q[0];
cz q[8],q[0];
u3(pi/512,pi/2,-pi/2) q[0];
u1(-1.5585245) q[8];
cz q[8],q[1];
u3(pi/256,-pi/2,pi/2) q[1];
cz q[8],q[1];
u3(pi/256,pi/2,-pi/2) q[1];
cz q[8],q[2];
u3(pi/128,-pi/2,pi/2) q[2];
cz q[8],q[2];
u3(pi/128,pi/2,-pi/2) q[2];
cz q[8],q[3];
u3(pi/64,-pi/2,pi/2) q[3];
cz q[8],q[3];
u3(pi/64,pi/2,-pi/2) q[3];
cz q[8],q[4];
u3(pi/32,-pi/2,pi/2) q[4];
cz q[8],q[4];
u3(pi/32,pi/2,-pi/2) q[4];
cz q[8],q[5];
u3(pi/16,-pi/2,pi/2) q[5];
cz q[8],q[5];
u3(pi/16,pi/2,-pi/2) q[5];
cz q[8],q[6];
u3(pi/8,-pi/2,pi/2) q[6];
cz q[8],q[6];
u3(pi/8,pi/2,-pi/2) q[6];
cz q[8],q[7];
u3(pi/4,-pi/2,pi/2) q[7];
cz q[8],q[7];
u3(pi/4,pi/2,-pi/2) q[7];
u2(-pi/1024,-pi) q[9];
cz q[9],q[0];
u3(pi/1024,-pi/2,pi/2) q[0];
cz q[9],q[0];
u3(pi/1024,pi/2,-pi/2) q[0];
cz q[10],q[0];
u3(pi/2048,-pi/2,pi/2) q[0];
cz q[10],q[0];
u3(pi/2048,pi/2,-pi/2) q[0];
u1(-1.5677284) q[10];
cz q[11],q[0];
u3(pi/4096,-pi/2,pi/2) q[0];
cz q[11],q[0];
u3(pi/4096,pi/2,-pi/2) q[0];
u1(-1.5692623) q[11];
cz q[12],q[0];
u3(pi/8192,-pi/2,pi/2) q[0];
cz q[12],q[0];
u3(pi/8192,pi/2,-pi/2) q[0];
u1(-1.5700293) q[12];
cz q[13],q[0];
u3(pi/16384,-pi/2,pi/2) q[0];
cz q[13],q[0];
u2(-pi/16384,-pi) q[0];
u1(-1.5704128) q[13];
u1(-1.5646604) q[9];
cz q[9],q[1];
u3(pi/512,-pi/2,pi/2) q[1];
cz q[9],q[1];
u3(pi/512,pi/2,-pi/2) q[1];
cz q[10],q[1];
u3(pi/1024,-pi/2,pi/2) q[1];
cz q[10],q[1];
u3(pi/1024,pi/2,-pi/2) q[1];
cz q[11],q[1];
u3(pi/2048,-pi/2,pi/2) q[1];
cz q[11],q[1];
u3(pi/2048,pi/2,-pi/2) q[1];
cz q[12],q[1];
u3(pi/4096,-pi/2,pi/2) q[1];
cz q[12],q[1];
u3(pi/4096,pi/2,-pi/2) q[1];
cz q[13],q[1];
u3(pi/8192,-pi/2,pi/2) q[1];
cz q[13],q[1];
u2(-pi/8192,-pi) q[1];
cz q[9],q[2];
u3(pi/256,-pi/2,pi/2) q[2];
cz q[9],q[2];
u3(pi/256,pi/2,-pi/2) q[2];
cz q[10],q[2];
u3(pi/512,-pi/2,pi/2) q[2];
cz q[10],q[2];
u3(pi/512,pi/2,-pi/2) q[2];
cz q[11],q[2];
u3(pi/1024,-pi/2,pi/2) q[2];
cz q[11],q[2];
u3(pi/1024,pi/2,-pi/2) q[2];
cz q[12],q[2];
u3(pi/2048,-pi/2,pi/2) q[2];
cz q[12],q[2];
u3(pi/2048,pi/2,-pi/2) q[2];
cz q[13],q[2];
u3(pi/4096,-pi/2,pi/2) q[2];
cz q[13],q[2];
u2(-pi/4096,-pi) q[2];
cz q[9],q[3];
u3(pi/128,-pi/2,pi/2) q[3];
cz q[9],q[3];
u3(pi/128,pi/2,-pi/2) q[3];
cz q[10],q[3];
u3(pi/256,-pi/2,pi/2) q[3];
cz q[10],q[3];
u3(pi/256,pi/2,-pi/2) q[3];
cz q[11],q[3];
u3(pi/512,-pi/2,pi/2) q[3];
cz q[11],q[3];
u3(pi/512,pi/2,-pi/2) q[3];
cz q[12],q[3];
u3(pi/1024,-pi/2,pi/2) q[3];
cz q[12],q[3];
u3(pi/1024,pi/2,-pi/2) q[3];
cz q[13],q[3];
u3(pi/2048,-pi/2,pi/2) q[3];
cz q[13],q[3];
u2(-pi/2048,-pi) q[3];
cz q[9],q[4];
u3(pi/64,-pi/2,pi/2) q[4];
cz q[9],q[4];
u3(pi/64,pi/2,-pi/2) q[4];
cz q[10],q[4];
u3(pi/128,-pi/2,pi/2) q[4];
cz q[10],q[4];
u3(pi/128,pi/2,-pi/2) q[4];
cz q[11],q[4];
u3(pi/256,-pi/2,pi/2) q[4];
cz q[11],q[4];
u3(pi/256,pi/2,-pi/2) q[4];
cz q[12],q[4];
u3(pi/512,-pi/2,pi/2) q[4];
cz q[12],q[4];
u3(pi/512,pi/2,-pi/2) q[4];
cz q[13],q[4];
u3(pi/1024,-pi/2,pi/2) q[4];
cz q[13],q[4];
u2(-pi/1024,-pi) q[4];
cz q[9],q[5];
u3(pi/32,-pi/2,pi/2) q[5];
cz q[9],q[5];
u3(pi/32,pi/2,-pi/2) q[5];
cz q[10],q[5];
u3(pi/64,-pi/2,pi/2) q[5];
cz q[10],q[5];
u3(pi/64,pi/2,-pi/2) q[5];
cz q[11],q[5];
u3(pi/128,-pi/2,pi/2) q[5];
cz q[11],q[5];
u3(pi/128,pi/2,-pi/2) q[5];
cz q[12],q[5];
u3(pi/256,-pi/2,pi/2) q[5];
cz q[12],q[5];
u3(pi/256,pi/2,-pi/2) q[5];
cz q[13],q[5];
u3(pi/512,-pi/2,pi/2) q[5];
cz q[13],q[5];
u2(-pi/512,-pi) q[5];
cz q[9],q[6];
u3(pi/16,-pi/2,pi/2) q[6];
cz q[9],q[6];
u3(pi/16,pi/2,-pi/2) q[6];
cz q[10],q[6];
u3(pi/32,-pi/2,pi/2) q[6];
cz q[10],q[6];
u3(pi/32,pi/2,-pi/2) q[6];
cz q[11],q[6];
u3(pi/64,-pi/2,pi/2) q[6];
cz q[11],q[6];
u3(pi/64,pi/2,-pi/2) q[6];
cz q[12],q[6];
u3(pi/128,-pi/2,pi/2) q[6];
cz q[12],q[6];
u3(pi/128,pi/2,-pi/2) q[6];
cz q[13],q[6];
u3(pi/256,-pi/2,pi/2) q[6];
cz q[13],q[6];
u2(-pi/256,-pi) q[6];
cz q[9],q[7];
u3(pi/8,-pi/2,pi/2) q[7];
cz q[9],q[7];
u3(pi/8,pi/2,-pi/2) q[7];
cz q[10],q[7];
u3(pi/16,-pi/2,pi/2) q[7];
cz q[10],q[7];
u3(pi/16,pi/2,-pi/2) q[7];
cz q[11],q[7];
u3(pi/32,-pi/2,pi/2) q[7];
cz q[11],q[7];
u3(pi/32,pi/2,-pi/2) q[7];
cz q[12],q[7];
u3(pi/64,-pi/2,pi/2) q[7];
cz q[12],q[7];
u3(pi/64,pi/2,-pi/2) q[7];
cz q[13],q[7];
u3(pi/128,-pi/2,pi/2) q[7];
cz q[13],q[7];
u2(-pi/128,-pi) q[7];
cz q[9],q[8];
u3(pi/4,-pi/2,pi/2) q[8];
cz q[9],q[8];
u3(pi/4,pi/2,-pi/2) q[8];
cz q[10],q[8];
u3(pi/8,-pi/2,pi/2) q[8];
cz q[10],q[8];
cz q[10],q[9];
u3(pi/8,pi/2,-pi/2) q[8];
cz q[11],q[8];
u3(pi/16,-pi/2,pi/2) q[8];
cz q[11],q[8];
u3(pi/16,pi/2,-pi/2) q[8];
cz q[12],q[8];
u3(pi/32,-pi/2,pi/2) q[8];
cz q[12],q[8];
u3(pi/32,pi/2,-pi/2) q[8];
cz q[13],q[8];
u3(pi/64,-pi/2,pi/2) q[8];
cz q[13],q[8];
u2(-pi/64,-pi) q[8];
u3(pi/4,-pi/2,pi/2) q[9];
cz q[10],q[9];
u3(pi/4,pi/2,-pi/2) q[9];
cz q[11],q[9];
u3(pi/8,-pi/2,pi/2) q[9];
cz q[11],q[9];
cz q[11],q[10];
u3(pi/4,-pi/2,pi/2) q[10];
cz q[11],q[10];
u3(pi/4,pi/2,-pi/2) q[10];
u3(pi/8,pi/2,-pi/2) q[9];
cz q[12],q[9];
u3(pi/16,-pi/2,pi/2) q[9];
cz q[12],q[9];
cz q[12],q[10];
u3(pi/8,-pi/2,pi/2) q[10];
cz q[12],q[10];
u3(pi/8,pi/2,-pi/2) q[10];
cz q[12],q[11];
u3(pi/4,-pi/2,pi/2) q[11];
cz q[12],q[11];
u3(pi/4,pi/2,-pi/2) q[11];
u3(pi/16,pi/2,-pi/2) q[9];
cz q[13],q[9];
u3(pi/32,-pi/2,pi/2) q[9];
cz q[13],q[9];
cz q[13],q[10];
u3(pi/16,-pi/2,pi/2) q[10];
cz q[13],q[10];
u2(-pi/16,-pi) q[10];
cz q[13],q[11];
u3(pi/8,-pi/2,pi/2) q[11];
cz q[13],q[11];
u2(-pi/8,-pi) q[11];
cz q[13],q[12];
u3(pi/4,-pi/2,pi/2) q[12];
cz q[13],q[12];
u2(-pi/4,-pi) q[12];
u2(0,pi) q[13];
u2(-pi/32,-pi) q[9];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],psi[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
measure q[7] -> c[7];
measure q[8] -> c[8];
measure q[9] -> c[9];
measure q[10] -> c[10];
measure q[11] -> c[11];
measure q[12] -> c[12];
measure q[13] -> c[13];