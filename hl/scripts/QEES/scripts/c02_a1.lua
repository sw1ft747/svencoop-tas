CreateTrigger("secondSC", Vector(763.312, 2041.438, 678.531), Vector(0, 0, 0), Vector(69.812, 48.562, 128.719));
CreateTrigger("secondSC_2", Vector(1568.469, 2985.594, 910.719), Vector(0, 0, 0), Vector(67.562, 27.906, 20.188));



printl( "Executed \"c02_a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "secondSC") then
		ClientCmd("sc_im_play c02_a1start");
		ClientCmd("setang 89.000000 180.307617 0.000000");

	elseif (name == "secondSC_2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c02_a1_contin");

    end
end


