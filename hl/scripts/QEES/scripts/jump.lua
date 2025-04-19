ClientCmd( "+jump; wait; wait; wait; +duck; toggle sc_strafe_type 1" );
CreateTimer( 0.68, ClientCmd, "sc_freeze2" );
CreateTimer( 0.8, ClientCmd, "-duck; -jump; sc_strafe_type 0" );