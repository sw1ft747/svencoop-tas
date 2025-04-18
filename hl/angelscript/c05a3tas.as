// hl_c05_a3 TAS script

class CFakeClient
{
	CFakeClient(edict_t@ pEdict, CBasePlayer@ pPlayer)
	{
		@m_pEdict = pEdict;
		@m_pPlayer = pPlayer;

		m_flLastRunMove = 0.f;

		m_vecViewAngles.x = 0.0f;
		m_vecViewAngles.y = 0.0f;
		m_vecViewAngles.z = 0.0f;

		m_flForwardMove = 0.0f;
		m_flSideMove = 0.0f;
		m_flUpMove = 0.0f;

		m_iButtons = 0;
		m_iImpulse = 0;
		m_iMsec = 0;

		m_bValid = true;
	}

	void RunMove()
	{
		m_iMsec = int( ( g_Engine.time - m_flLastRunMove ) * 1000 );

		if ( m_iMsec > 255 )
			m_iMsec = 0;

		m_flLastRunMove = g_Engine.time;

		m_pPlayer.pev.fixangle = FAM_NOTHING;

		g_EngineFuncs.RunPlayerMove( m_pEdict, m_vecViewAngles, m_flForwardMove, m_flSideMove, m_flUpMove, uint16(m_iButtons), uint8(m_iImpulse), uint8(m_iMsec) );

		// m_flForwardMove = 0.0f;
		// m_flSideMove = 0.0f;
		// m_flUpMove = 0.0f;

		// m_iButtons = 0;
		m_iImpulse = 0;
	}

	void SetViewAngles(Vector vecViewAngles)
	{
		m_vecViewAngles = vecViewAngles;
	}

	void SetForwardMove(float flForwardMove)
	{
		m_flForwardMove = flForwardMove;
	}

	void SetSideMove(float flSideMove)
	{
		m_flSideMove = flSideMove;
	}

	void SetUpMove(float flUpMove)
	{
		m_flUpMove = flUpMove;
	}

	void AddButton(int buttons)
	{
		m_iButtons |= buttons;
	}

	void AddImpulse(int impulse)
	{
		m_iImpulse |= impulse;
	}

	void RemoveButton(int buttons)
	{
		m_iButtons &= ~buttons;
	}

	void RemoveImpulse(int impulse)
	{
		m_iImpulse &= ~impulse;
	}

	bool IsValid()
	{
		return g_EntityFuncs.IsValidEntity( m_pEdict );
	}

	edict_t@ GetEntity()
	{
		return m_pEdict;
	}

	CBasePlayer@ GetPlayerEntity()
	{
		return m_pPlayer;
	}

	edict_t@ m_pEdict;
	CBasePlayer@ m_pPlayer;

	float m_flLastRunMove;

	Vector m_vecViewAngles;

	float m_flForwardMove;
	float m_flSideMove;
	float m_flUpMove;

	int m_iButtons;
	int m_iImpulse;
	int m_iMsec;

	bool m_bValid;
}

namespace FakeClientsManager
{
	class CFakeClientProfile
	{
		CFakeClientProfile(string sName, string sModel, int iTopColor, int iBottomColor)
		{
			m_sName = sName;
			m_sModel = sModel;
			m_iTopColor = iTopColor;
			m_iBottomColor = iBottomColor;
		}

		string m_sName;
		string m_sModel;
		int m_iTopColor;
		int m_iBottomColor;
	}

	void Think()
	{
		for (uint i = 0; i < FakeClientsList.length(); i++)
		{
			CFakeClient@ pFakeClient = FakeClientsList[i];

			if ( !pFakeClient.IsValid() )
			{
				pFakeClient.m_bValid = false;

				FakeClientsList.removeAt( i );
				i--;

				continue;
			}

			pFakeClient.RunMove();
		}
	}

	void AddProfile(string sName, string sModel, int iTopColor, int iBottomColor)
	{
		ProfilesList.insertLast( CFakeClientProfile(sName, sModel, iTopColor, iBottomColor) );
	}

	void RemoveAll()
	{
		for (uint i = 0; i < FakeClientsList.length(); i++)
		{
			CFakeClient@ pFakeClient = FakeClientsList[i];

			if ( pFakeClient.IsValid() )
			{
				g_AdminControl.KickPlayer( cast<CBasePlayer@>( g_EntityFuncs.Instance( pFakeClient.GetEntity() ) ) );
			}

			pFakeClient.m_bValid = false;
		}

		FakeClientsList.resize( 0 );
	}

	void SpawnFromProfilesList()
	{
		array<CFakeClientProfile@> profileList = ProfilesList;

		while ( profileList.length() > 0 )
		{
			int idx = RandomInt(0, profileList.length() - 1);

			CFakeClientProfile@ profile = profileList[ idx ];
			CBasePlayer@ pBot = g_PlayerFuncs.CreateBot( profile.m_sName );

			if ( pBot !is null )
			{
				KeyValueBuffer@ pInfoBuffer = g_EngineFuncs.GetInfoKeyBuffer( pBot.edict() );

				pInfoBuffer.SetValue( "model", profile.m_sModel );				
				pInfoBuffer.SetValue( "topcolor", profile.m_iTopColor );
				pInfoBuffer.SetValue( "bottomcolor", profile.m_iBottomColor );

				pInfoBuffer.SetValue( "rate", 50000 );
				pInfoBuffer.SetValue( "cl_updaterate", 80 );
				pInfoBuffer.SetValue( "cl_lw", 1 );
				pInfoBuffer.SetValue( "cl_lc", 1 );
				pInfoBuffer.SetValue( "cl_dlmax", 512 );

				pBot.pev.fixangle = FAM_NOTHING;

				FakeClientsList.insertLast( CFakeClient( pBot.edict(), pBot ) );
			}

			profileList.removeAt( idx );
		}
	}

	array<CFakeClient@> FakeClientsList;
	array<CFakeClientProfile@> ProfilesList;
}

CClientCommand tas_c05a3_spawnbot("tas_c05a3_spawnbot", "n", @tas_c05a3_spawnbot_command);
void tas_c05a3_spawnbot_command(const CCommand@ pArgs)
{
	SpawnFakeClients();
}

CClientCommand tas_c05a3_drawmedkit("tas_c05a3_drawmedkit", "n", @tas_c05a3_drawmedkit_command);
void tas_c05a3_drawmedkit_command(const CCommand@ pArgs)
{
	for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
	{
		CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

		if ( !pFakeClient.IsValid() )
		{
			continue;
		}

		pFakeClient.GetPlayerEntity().SelectItem( "weapon_medkit" );
	}
}

CClientCommand tas_c05a3_suicide("tas_c05a3_suicide", "n", @tas_c05a3_suicide_command);
void tas_c05a3_suicide_command(const CCommand@ pArgs)
{
	for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
	{
		CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

		if ( !pFakeClient.IsValid() )
		{
			continue;
		}

		pFakeClient.GetPlayerEntity().Killed( pFakeClient.GetPlayerEntity().pev, 0 );
	}
}

CClientCommand tas_c05a3_setviewangles("tas_c05a3_setviewangles", "n", @tas_c05a3_setviewangles_command);
void tas_c05a3_setviewangles_command(const CCommand@ pArgs)
{
	if ( pArgs.ArgC() <= 2 )
		return;
	
	Vector vecAngles;

	vecAngles.x = atof( pArgs[ 1 ] );
	vecAngles.y = atof( pArgs[ 2 ] );

	for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
	{
		CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

		if ( !pFakeClient.IsValid() )
		{
			continue;
		}

		pFakeClient.SetViewAngles( vecAngles );
	}
}

CClientCommand tas_c05a3_setbuttons("tas_c05a3_setbuttons", "n", @tas_c05a3_setbuttons_command);
void tas_c05a3_setbuttons_command(const CCommand@ pArgs)
{
	if ( pArgs.ArgC() <= 1 )
		return;
	
	int buttons = atoi( pArgs[ 1 ] );

	for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
	{
		CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

		if ( !pFakeClient.IsValid() )
		{
			continue;
		}

		pFakeClient.m_iButtons = buttons;
	}
}

CClientCommand tas_c05a3_moveforward("tas_c05a3_moveforward", "n", @tas_c05a3_moveforward_command);
void tas_c05a3_moveforward_command(const CCommand@ pArgs)
{
	if ( pArgs.ArgC() == 1 )
	{
		for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
		{
			CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

			if ( !pFakeClient.IsValid() )
			{
				continue;
			}

			Vector vecDir;
			Vector vecForward;
			Vector vecRight;

			CBasePlayer@ pPlayer = pFakeClient.GetPlayerEntity();

			// Forward angles
			vecForward.x = cos(pFakeClient.m_vecViewAngles.y * Math.PI / 180.0f);
			vecForward.y = sin(pFakeClient.m_vecViewAngles.y * Math.PI / 180.0f);

			// Direction to move
			vecDir = vecForward;

			// Make a right vector of angles. Rotate forward vector as a complex number by 90 deg.
			vecRight.x = vecForward.y;
			vecRight.y = -vecForward.x;

			// Multiply by max movement speed
			vecForward = vecForward * pPlayer.GetMaxSpeed();
			vecRight = vecRight * pPlayer.GetMaxSpeed();

			// Project onto direction vector
			float forwardmove = DotProduct(vecForward, vecDir);
			float sidemove = DotProduct(vecRight, vecDir);

			// Apply moves
			pFakeClient.SetForwardMove( forwardmove );
			pFakeClient.SetSideMove( sidemove );
		}
	}
	else
	{
		for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
		{
			CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

			if ( !pFakeClient.IsValid() )
			{
				continue;
			}

			// Apply moves
			pFakeClient.SetForwardMove( 0.0f );
			pFakeClient.SetSideMove( 0.0f );
		}
	}
}

void InitFakeClientsProfiles()
{
	FakeClientsManager::AddProfile( "void", "SG_KurisuMakise_alt2", 0, 0 );
	//FakeClientsManager::AddProfile( "Sw1ft", "helmet", 0, 0 );
}

void GameFrame()
{
	if ( g_bIsC05A3 )
		FakeClientsManager::Think();
}

void SpawnFakeClients()
{
	if ( g_bIsC05A3 )
	{
		FakeClientsManager::SpawnFromProfilesList();

		for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
		{
			CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

			if ( !pFakeClient.IsValid() )
			{
				continue;
			}

			pFakeClient.SetViewAngles( Vector( 0, 0, 0 ) );
		}
	}
}

void MapInit()
{
	string sMapname = g_Engine.mapname;
	
	g_bIsC05A3 = true;
	g_bFirstPlayerConnected = false;

	DateTime date();
	uint64 time = uint64( date.ToUnixTimestamp() );

	srand(time);

	FakeClientsManager::RemoveAll();
}

void MapActivate()
{
}

void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor( "Sw1ft" );
	g_Module.ScriptInfo.SetContactInfo( "hell no" );
	
	g_Hooks.RegisterHook( Hooks::Player::ClientPutInServer, OnClientPutInServer );

	g_Scheduler.SetInterval( "GameFrame", 0.0f, g_Scheduler.REPEAT_INFINITE_TIMES );

	InitFakeClientsProfiles();

	// for (int i = 4; i < 1000; i++)
	// {
	// 	CBaseEntity@ pEntity = g_EntityFuncs.Instance(i);

	// 	if ( pEntity !is null )
	// 	{
	// 		if ( pEntity.pev.model == "*65" || pEntity.pev.model == "*66" )
	// 		{
	// 			pEntity.pev.health = 1000000;
	// 		}
	// 	}
	// }
}

HookReturnCode OnClientPutInServer( CBasePlayer@ pPlayer )
{
	if ( !g_bFirstPlayerConnected )
	{
		g_bFirstPlayerConnected = true;
	}

	return HOOK_CONTINUE;
}

// Misc. shit

uint64 random = 1;
bool g_bIsC05A3 = false;
bool g_bFirstPlayerConnected = false;

int rand()
{
    random = random * 1103515245 + 12345;
    int mda = int(random / 65536) % 32768;

	if ( mda < 0 )
		mda = -mda;
	
	return mda;
}

void srand(uint64 seed) { random = seed; }
int RandomInt(int min, int max) { return min + rand() % (max - min + 1); }

float UTIL_VectorLengthSqr(const Vector v)
{
	return v.x * v.x + v.y * v.y + v.z * v.z;
}

Vector UTIL_DirectionToAngles(Vector vecDir)
{
	Vector vecAngles;

	Vector vecDir2D = vecDir;
	vecDir2D.z = 0.0f;

	vecAngles.x = -atan2(vecDir.z, vecDir2D.Length()) * 180.0f / Math.PI;
	vecAngles.y = atan2(vecDir.y, vecDir.x) * 180.0f / Math.PI;
	vecAngles.z = 0.f;

	return vecAngles;
}