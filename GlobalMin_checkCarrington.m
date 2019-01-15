


function [f] = GlobalMin_checkCarrington()

load('NN-15-140-1_tansig-purelin_minmax_Iter_01234_trainLM');


EPAPS_w1 = xlsread('EPAPS_w1.xls');
EPAPS_b1 = xlsread('EPAPS_b1.xls');
EPAPS_w2 = xlsread('EPAPS_w2_MODIFIED.xls');
EPAPS_b2 = xlsread('EPAPS_b2.xls');


net.iw{1,1} = EPAPS_w1;
net.b{1} = EPAPS_b1;
net.lw{2,1} = EPAPS_w2;
net.b{2} = EPAPS_b2;

NN_w1 = net.iw{1,1};
NN_b1 = net.b{1};
NN_w2 = net.lw{2,1};
NN_b2 = net.b{2};



