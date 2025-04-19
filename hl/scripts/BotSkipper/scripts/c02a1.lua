CreateTrigger("start", Vector(1518.219, 257.688, -111.906), Vector(0, 0, 0), Vector(1.562, 208.594, 56.281)); 
CreateTrigger("r1", Vector(1264.000, 136.000, -113.969), Vector(0, 0, 0), Vector(18.995, 16.246, 63.016));
CreateTrigger("dverfinish", Vector(1245.219, 605.188, -139.906), Vector(0, 0, 0), Vector(96.344, 6.594, 120.031));
CreateTrigger("freeze", Vector(56.344, 1190.719, -135.406), Vector(0, 0, 0), Vector(125.281, 4.281, 110.875));
CreateTrigger("r2", Vector(40.688, 1258.250, -147.969), Vector(0, 0, 0), Vector(138.438, 6.062, 142.969));
CreateTrigger("r3", Vector(1483.656, 1873.469, -140.156), Vector(0, 0, 0), Vector(315.750, 13.750, 205.531));
CreateTrigger("secondSC", Vector(763.312, 2041.438, 678.531), Vector(0, 0, 0), Vector(69.812, 48.562, 128.719)); 
CreateTrigger("secondSC_2", Vector(1568.469, 2985.594, 910.719), Vector(0, 0, 0), Vector(67.562, 27.906, 20.188));
CreateTrigger("FINALLY", Vector(2103.438, 1790.312, 802.906), Vector(0, 0, 0), Vector(1.562, 133.531, 176.000)); 
printl("c02a1 men");

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "start") then 
		ClientCmd("sc_im_play okno");
	elseif (name == "r1") then
		ClientCmd("sc_im_stop;wait;sc_im_play dver")
	elseif (name == "dverfinish") then
		ClientCmd("sc_im_stop;wait;sc_im_play dver2");
	elseif (name == "freeze") then
		ClientCmd("sc_freeze2;w100;w8;sc_freeze2");
	elseif (name == "r2") then
		ClientCmd("sc_im_stop;wait;sc_im_play dver3");
	elseif (name == "r3") then
		ClientCmd("sc_im_stop;wait;sc_im_play lomik")
	elseif (name == "secondSC") then				
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c02_a1start");
		ClientCmd("setang 89.000000 180.307617 0.000000\n");
	elseif (name == "secondSC_2") then
		ClientCmd("sc_im_stop\n");
		ClientCmd("sc_im_play c02_a1_contin");
	elseif (name == "FINALLY") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c02_a1_final");
	end
end
