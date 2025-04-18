// hl_c17 TAS script

enum C17Status
{
	C17_STATUS_WAITING_FOR_PLAYERS = 0,
	C17_STATUS_WAITING_FOR_SPAWN,
	C17_STATUS_ENTERING_BATTLEFIELD,
	C17_STATUS_IN_BATTLEFIELD,
	C17_STATUS_MAP_FINISHED
}

enum C17Activity
{
	C17_ACTIVITY_NONE = 0,
	C17_ACTIVITY_CRYSTAL,
	C17_ACTIVITY_NIHILANTH
}

int g_iUraniumAmmoIndex = -1;

CClientCommand TakeOverBots_Cmd("takecover", "n", @TakeOverBotsCmd);

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

		m_flForwardMove = 0.0f;
		m_flSideMove = 0.0f;
		m_flUpMove = 0.0f;

		m_iButtons = 0;
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

class CFakeClientActivity
{
	CFakeClientActivity(CFakeClient@ pFakeClient)
	{
		@m_pFakeClient = pFakeClient;
		m_iActivity = C17_ACTIVITY_NONE;
	}

	CFakeClientActivity(CFakeClient@ pFakeClient, int activity)
	{
		@m_pFakeClient = pFakeClient;
		m_iActivity = activity;
	}

	CFakeClient@ GetClient()
	{
		return m_pFakeClient;
	}

	int GetActivity()
	{
		return m_iActivity;
	}

	void SetActivity(int activity)
	{
		m_iActivity = activity;
	}

	CFakeClient@ m_pFakeClient;
	int m_iActivity;
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

void InitFakeClientsProfiles()
{
	FakeClientsManager::AddProfile( "Grinder", "sa_ryder", 0, 0 );
	FakeClientsManager::AddProfile( "BotSkipper", "fgo_astolfo-sf", 0, 0 );
	FakeClientsManager::AddProfile( "pidor", "betagordon", 0, 0 );
	FakeClientsManager::AddProfile( "kolokola777", "rat", 0, 0 );
	FakeClientsManager::AddProfile( "dram", "barney2", 133, 226 );
	FakeClientsManager::AddProfile( "Sw1ft", "arknights_lappland", 0, 0 );
	FakeClientsManager::AddProfile( "QEES51", "marisa3", 0, 0 );
	FakeClientsManager::AddProfile( "rudd1y", "ugg_goosec", 140, 0 );
	FakeClientsManager::AddProfile( "Rekker", "nekopara_ethanol_v4", 0, 0 );
	FakeClientsManager::AddProfile( "GrafSativia", "al_enterprise_v2", 0, 0 );
	FakeClientsManager::AddProfile( "anime is gay`ё", "zombie", 0, 168 );
	FakeClientsManager::AddProfile( "yessu", "km_karenkujo_alt", 0, 0 );
	FakeClientsManager::AddProfile( "Monstum", "gi_ganyu", 0, 0 );
	FakeClientsManager::AddProfile( "myself", "gf_ump45", 0, 0 );
	FakeClientsManager::AddProfile( "kowalski", "gordon_scientist", 0, 0 );
	FakeClientsManager::AddProfile( "loser1", "gfl_hk416", 0, 0 );
	FakeClientsManager::AddProfile( "loser3", "km_karenkujo_alt", 0, 0 );
	FakeClientsManager::AddProfile( "buncun", "rintohsaka", 0, 0 );
	FakeClientsManager::AddProfile( "Hawkins", "gi_klee", 0, 0 );
	FakeClientsManager::AddProfile( "Sleepy", "gi_diona", 0, 0 );
	FakeClientsManager::AddProfile( "vlctoralexander", "aswat", 0, 0 );
	FakeClientsManager::AddProfile( "Oldrey", "madscientist", 0, 0 );
	FakeClientsManager::AddProfile( "vlad", "ugg_goosec", 200, 0 );
	FakeClientsManager::AddProfile( "remi", "nekomimi_wafuku2_b", 0, 0 );
	FakeClientsManager::AddProfile( "Nude girl", "kate", 0, 0 );
	FakeClientsManager::AddProfile( "sphorse", "Purple_Sister", 0, 0 );
	FakeClientsManager::AddProfile( "SexyBowsette", "kz_bowsette", 0, 0 );
	FakeClientsManager::AddProfile( "SexyNeptunia", "hdn_neppugia", 0, 0 );
	FakeClientsManager::AddProfile( "SexySanae", "touhou_sanae_jky", 208, 204 );

	// 28
}

// Main part
namespace C17
{
	bool bValidMap = false;
	float flSpawnTime = 0.0f;
	int status = C17_STATUS_WAITING_FOR_PLAYERS;

	array<CBaseEntity@> pNihilanth(1, null);
	array<CBaseEntity@> pCrystalA(1, null);
	array<CBaseEntity@> pCrystalB(1, null);
	array<CBaseEntity@> pCrystalC(1, null);

	array<CFakeClientActivity@> TeamAlpha; // nihilanth
	array<CFakeClientActivity@> TeamBeta; // crystal A
	array<CFakeClientActivity@> TeamGamma; // crystal B
	array<CFakeClientActivity@> TeamDelta; // crystal C

	Vector vecCrystalA = Vector(-1.629125, 1959.460449, 430.331543);
	Vector vecCrystalB = Vector(-1947.968750, -2.128750, 1883.257080);
	Vector vecCrystalC = Vector(-0.812500, -1947.406250, 2536.194092);

	const Vector vecMostRightSpot = Vector(1867.625000, -650.718750, 0);
	const Vector vecMostLeftSpot = Vector(284.000000, -1940.406250, 0);

	void PreInit()
	{
		bValidMap = ( g_Engine.mapname == "hl_c17" );

		status = C17_STATUS_WAITING_FOR_PLAYERS;

		TeamAlpha.resize( 0 );
		TeamBeta.resize( 0 );
		TeamGamma.resize( 0 );
		TeamDelta.resize( 0 );
	}

	void Init()
	{
		if ( !bValidMap )
			return;

		status = C17_STATUS_WAITING_FOR_SPAWN;
		
		CBaseEntity@ pEntity = null;

		if ( (@pEntity = g_EntityFuncs.FindEntityByTargetname(null, "crystal1")) !is null )
		{
			@pCrystalA[0] = pEntity;
		}

		@pEntity = null;

		if ( (@pEntity = g_EntityFuncs.FindEntityByTargetname(null, "crystal2")) !is null )
		{
			@pCrystalB[0] = pEntity;
		}

		@pEntity = null;

		if ( (@pEntity = g_EntityFuncs.FindEntityByTargetname(null, "crystal3")) !is null )
		{
			@pCrystalC[0] = pEntity;
		}
		@pEntity = null;

		if ( (@pEntity = g_EntityFuncs.FindEntityByTargetname(null, "nihilanth")) !is null )
		{
			@pNihilanth[0] = pEntity;
		}
	}

	void Think()
	{
		if ( !bValidMap )
			return;

		const Vector vecStayPoint = Vector(0, 0, 0);

		if ( status == C17_STATUS_WAITING_FOR_SPAWN )
		{
			CBaseEntity@ pEntity = g_EntityFuncs.FindEntityByClassname(null, "player");
			CBasePlayer@ pPlayer = cast<CBasePlayer@>(pEntity);

			if ( pPlayer !is null )
			{
				const Vector vecTriggerMins = Vector(-580.938, -1881.500, 2257.759) + Vector(0, 0, -3593.727);
				const Vector vecTriggerMaxs = Vector(-580.938, -1881.500, 2257.759) + Vector(2450.929, 2520.259, 0);

				if ( (pPlayer.pev.origin.x <= vecTriggerMaxs.x && pPlayer.pev.origin.x >= vecTriggerMins.x) &&
					(pPlayer.pev.origin.y <= vecTriggerMaxs.y && pPlayer.pev.origin.y >= vecTriggerMins.y) &&
					(pPlayer.pev.origin.z <= vecTriggerMaxs.z && pPlayer.pev.origin.z >= vecTriggerMins.z) )
				{
					// status = C17_STATUS_ENTERING_BATTLEFIELD;
					// flSpawnTime = g_Engine.time;

					status = C17_STATUS_IN_BATTLEFIELD;

					UnstuckFakeClients();
					AssignToTeams();

					// Repeat think
					Think();
				}
			}

			if ( status == C17_STATUS_WAITING_FOR_SPAWN )
			{
				ChargeGaussEveryone();
			}
		}
		else if ( status == C17_STATUS_ENTERING_BATTLEFIELD )
		{
			if ( g_Engine.time - flSpawnTime >= 0.0f )
			{
				status = C17_STATUS_IN_BATTLEFIELD;

				AssignToTeams();
				
				Think();
			}
			else
			{
				ChargeGaussEveryone();
			}
		}
		else if ( status == C17_STATUS_IN_BATTLEFIELD )
		{
			if ( pNihilanth[0].pev.health > 0.0f )
			{
				Vector vecToCrystalA;
				Vector vecToCrystalB;
				Vector vecToCrystalC;

				Vector vecToNihilanth;

				// Shoot nihilanth
				for (uint i = 0; i < TeamAlpha.length(); i++)
				{
					CFakeClientActivity@ pFakeClientActivity = TeamAlpha[i];
					CFakeClient@ pFakeClient = pFakeClientActivity.GetClient();

					if ( !pFakeClient.IsValid() )
						continue;

					Vector vecDir = pNihilanth[0].pev.origin - pFakeClient.GetPlayerEntity().EyePosition();

					vecToNihilanth = Math.VecToAngles( vecDir );
					vecToNihilanth.x = -vecToNihilanth.x;

					pFakeClient.SetViewAngles( vecToNihilanth );

					pFakeClient.AddButton( IN_ATTACK );

					CBasePlayer@ pFakeClientPlayer = pFakeClient.GetPlayerEntity();

					if ( pFakeClientPlayer.m_hActiveItem.GetEntity() !is null )
					{
						CBasePlayerWeapon@ pWeapon = cast<CBasePlayerWeapon@>( pFakeClientPlayer.m_hActiveItem.GetEntity() );

						if ( pWeapon !is null )
						{
							if ( pWeapon.m_iId == WEAPON_HORNETGUN )
							{
								pFakeClient.AddButton( IN_ATTACK2 );
							}
							else if ( pFakeClientPlayer.m_rgAmmo( g_iUraniumAmmoIndex ) > 0 )
							{
								pFakeClient.AddButton( IN_ATTACK );
							}
							else
							{
								pFakeClientPlayer.SelectItem("weapon_hornetgun");
							}
						}
					}

					MoveTo( pFakeClient, vecStayPoint );
				}

				// Shoot crystals once
				if ( TeamBeta.length() > 0 )
				{
					for (uint i = 0; i < TeamBeta.length(); i++)
					{
						CFakeClientActivity@ pFakeClientActivity = TeamBeta[i];
						CFakeClient@ pFakeClient = pFakeClientActivity.GetClient();

						if ( !pFakeClient.IsValid() )
							continue;

						Vector vecDir = vecCrystalA - pFakeClient.GetPlayerEntity().EyePosition();
						// Vector vecDir = pCrystalA[0].pev.origin - pFakeClient.GetPlayerEntity().EyePosition();

						vecToCrystalA = Math.VecToAngles( vecDir );
						vecToCrystalA.x = -vecToCrystalA.x;

						pFakeClient.SetViewAngles( vecToCrystalA );

						TeamAlpha.insertLast( pFakeClientActivity );
					}

					for (uint i = 0; i < TeamGamma.length(); i++)
					{
						CFakeClientActivity@ pFakeClientActivity = TeamGamma[i];
						CFakeClient@ pFakeClient = pFakeClientActivity.GetClient();

						if ( !pFakeClient.IsValid() )
							continue;

						Vector vecDir = vecCrystalB - pFakeClient.GetPlayerEntity().EyePosition();
						// Vector vecDir = pCrystalB[0].pev.origin - pFakeClient.GetPlayerEntity().EyePosition();

						vecToCrystalB = Math.VecToAngles( vecDir );
						vecToCrystalB.x = -vecToCrystalB.x;

						pFakeClient.SetViewAngles( vecToCrystalB );

						TeamAlpha.insertLast( pFakeClientActivity );
					}

					for (uint i = 0; i < TeamDelta.length(); i++)
					{
						CFakeClientActivity@ pFakeClientActivity = TeamDelta[i];
						CFakeClient@ pFakeClient = pFakeClientActivity.GetClient();

						if ( !pFakeClient.IsValid() )
							continue;

						Vector vecDir = vecCrystalC - pFakeClient.GetPlayerEntity().EyePosition();
						// Vector vecDir = pCrystalC[0].pev.origin - pFakeClient.GetPlayerEntity().EyePosition();

						vecToCrystalC = Math.VecToAngles( vecDir );
						vecToCrystalC.x = -vecToCrystalC.x;

						pFakeClient.SetViewAngles( vecToCrystalC );

						TeamAlpha.insertLast( pFakeClientActivity );
					}

					TeamBeta.resize( 0 );
					TeamGamma.resize( 0 );
					TeamDelta.resize( 0 );
				}
			}
			else
			{
				@pNihilanth[0] = null;

				status = C17_STATUS_MAP_FINISHED;

				// Draw crowbar
				for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
				{
					CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

					if ( pFakeClient.IsValid() )
					{
						CBasePlayer@ pFakeClientPlayer = pFakeClient.GetPlayerEntity();

						pFakeClientPlayer.SelectItem("weapon_crowbar");
					}
				}
			}
		}
		else if ( status == C17_STATUS_MAP_FINISHED )
		{
			for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
			{
				CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

				if ( pFakeClient.IsValid() )
				{
					Vector vecToPoint;

					Vector vecDir = Vector(0, 0, 0);
					Vector vecEye = pFakeClient.GetPlayerEntity().EyePosition();

					vecDir.z = vecEye.z;
					vecDir = vecDir - vecEye;

					vecToPoint = Math.VecToAngles( vecDir );
					vecToPoint.x = -vecToPoint.x;

					pFakeClient.SetViewAngles( vecToPoint );

					MoveTo( pFakeClient, vecStayPoint );
				}
			}
		}
	}

	bool RightSpotSortFunc(const CFakeClient@ &in a, const CFakeClient@ &in b)
	{
		Vector a_pos = a.m_pPlayer.pev.origin;
		Vector b_pos = b.m_pPlayer.pev.origin;

		a_pos.z = 0.0f;
		b_pos.z = 0.0f;

		float a_distsqr = UTIL_VectorLengthSqr( vecMostRightSpot - a_pos );
		float b_distsqr = UTIL_VectorLengthSqr( vecMostRightSpot - b_pos );

		return a_distsqr < b_distsqr;
	}

	bool LeftSpotSortFunc(const CFakeClient@ &in a, const CFakeClient@ &in b)
	{
		Vector a_pos = a.m_pPlayer.pev.origin;
		Vector b_pos = b.m_pPlayer.pev.origin;

		a_pos.z = 0.0f;
		b_pos.z = 0.0f;

		float a_distsqr = UTIL_VectorLengthSqr( vecMostLeftSpot - a_pos );
		float b_distsqr = UTIL_VectorLengthSqr( vecMostLeftSpot - b_pos );

		return a_distsqr < b_distsqr;
	}

	void AssignToTeams()
	{
		array<CFakeClient@> freeSlaves = FakeClientsManager::FakeClientsList;

		// Form team Beta
		freeSlaves.sort( RightSpotSortFunc );

		// minimum 6 players required to deal to a crystal 1000 damage; full charged gauss deals 19*10 damage, then 190 * 6 = 1140
		for (int i = 0; i < 6; i++)
		{
			CFakeClient@ pFakeClient = freeSlaves[0];

			TeamBeta.insertLast( CFakeClientActivity( pFakeClient, C17_ACTIVITY_CRYSTAL ) );
			freeSlaves.removeAt( 0 );
		}

		// Form team Gamma
		freeSlaves.sort( LeftSpotSortFunc );

		for (int i = 0; i < 6; i++)
		{
			TeamGamma.insertLast( CFakeClientActivity( freeSlaves[0], C17_ACTIVITY_CRYSTAL ) );
			freeSlaves.removeAt( 0 );
		}

		// Form team Delta
		freeSlaves.sort( RightSpotSortFunc );

		for (int i = 0; i < 6; i++)
		{
			TeamDelta.insertLast( CFakeClientActivity( freeSlaves[0], C17_ACTIVITY_CRYSTAL ) );
			freeSlaves.removeAt( 0 );
		}

		// Rest will attack Nihilanth
		for (uint i = 0; i < freeSlaves.length(); i++)
		{
			TeamAlpha.insertLast( CFakeClientActivity( freeSlaves[i], C17_ACTIVITY_NIHILANTH ) );
		}
	}

	void UnstuckFakeClients()
	{
		for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
		{
			CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

			if ( pFakeClient.IsValid() )
			{
				int forward_dir = RandomInt(0, 1);
				int side_dir = RandomInt(0, 1);

				if ( forward_dir == 0 )
					forward_dir = -1;
				
				if ( side_dir == 0 )
					side_dir = -1;
				
				pFakeClient.SetForwardMove( pFakeClient.GetPlayerEntity().GetMaxSpeed() * forward_dir );
				pFakeClient.SetSideMove( pFakeClient.GetPlayerEntity().GetMaxSpeed() * side_dir );
			}
		}
	}

	void ChargeGaussEveryone()
	{
		for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
		{
			CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

			if ( pFakeClient.IsValid() )
			{
				CBasePlayer@ pFakeClientPlayer = pFakeClient.GetPlayerEntity();

				if ( pFakeClientPlayer.m_hActiveItem.GetEntity() !is null )
				{
					CBasePlayerWeapon@ pWeapon = cast<CBasePlayerWeapon@>( pFakeClientPlayer.m_hActiveItem.GetEntity() );

					if ( pWeapon !is null )
					{
						if ( pWeapon.m_iId != WEAPON_GAUSS )
						{
							pFakeClientPlayer.SelectItem("weapon_gauss");
						}
						else
						{
							pFakeClient.AddButton( IN_ATTACK2 );
						}
					}
				}
			}
		}
	}

	void MoveTo(CFakeClient@ pFakeClient, Vector vecTargetPos)
	{
		Vector vecDir;
		Vector vecForward;
		Vector vecRight;

		CBasePlayer@ pPlayer = pFakeClient.GetPlayerEntity();

		vecDir = vecTargetPos - pPlayer.pev.origin;
		vecDir.z = 0.0f;

		vecDir = vecDir.Normalize();

		int nRandom = RandomInt(0, 1);

		float theta = 30.0f * Math.PI / 180.0f;
		float ct = cos(theta);
		float st = sin(theta);

		if ( nRandom == 1 ) // counter clockwise
		{
			vecDir.x = vecDir.x * ct - vecDir.y * st;
			vecDir.y = vecDir.x * st + vecDir.y * ct;
		}
		else // clockwise
		{
			vecDir.x = vecDir.x * ct + vecDir.y * st;
			vecDir.y = -vecDir.x * st + vecDir.y * ct;
		}

		// Forward angles
		vecForward.x = cos(pFakeClient.m_vecViewAngles.y * Math.PI / 180.0f);
		vecForward.y = sin(pFakeClient.m_vecViewAngles.y * Math.PI / 180.0f);

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

	bool CanSeeEntity(CFakeClient@ pFakeClient, CBaseEntity@ pTarget)
	{
		CBasePlayer@ pPlayer = pFakeClient.GetPlayerEntity();

		TraceResult traceResult;

		Vector vecAiming = pPlayer.GetAutoaimVector( 0.0f );
		
		Vector vecSrc = pPlayer.GetGunPosition();
		Vector vecEnd = vecSrc + vecAiming * 16384.0f;

		g_Utility.TraceLine( vecSrc, vecEnd, dont_ignore_monsters, pPlayer.edict(), traceResult );

		CBaseEntity@ pEntity = g_EntityFuncs.Instance( traceResult.pHit );

		return pEntity is pTarget;
	}
}

void TakeOverBotsCmd(const CCommand@ pArgs)
{
	for (uint i = 0; i < FakeClientsManager::FakeClientsList.length(); i++)
	{
		CFakeClient@ pFakeClient = FakeClientsManager::FakeClientsList[i];

		if ( pFakeClient.IsValid() )
		{
			CBasePlayer@ pFakeClientPlayer = pFakeClient.GetPlayerEntity();

			pFakeClientPlayer.ShowOverheadSprite( "sprites/grenade.spr", 51.0f, 2.5f );
			g_SoundSystem.PlaySound( pFakeClientPlayer.edict(), CHAN_VOICE, "speech/grenade1.wav", 1.0f, ATTN_NORM, 0, PITCH_NORM );
		}
	}
}

void GameFrame()
{
	C17::Think();
	FakeClientsManager::Think();
}

void SpawnFakeClients()
{
	FakeClientsManager::SpawnFromProfilesList();
}

void UnstuckFakeClients()
{
	C17::UnstuckFakeClients();
}

void MapInit()
{
	g_bFirstPlayerConnected = false;

	DateTime date();
	uint64 time = uint64( date.ToUnixTimestamp() );

	srand(time);

	FakeClientsManager::RemoveAll();

	C17::PreInit();
}

void MapActivate()
{
	g_iUraniumAmmoIndex = g_PlayerFuncs.GetAmmoIndex( "uranium" );

	C17::Init();
}

void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor( "Sw1ft" );
	g_Module.ScriptInfo.SetContactInfo( "hell no" );
	
	g_Hooks.RegisterHook( Hooks::Player::ClientPutInServer, OnClientPutInServer );

	g_Scheduler.SetInterval( "GameFrame", 0.0f, g_Scheduler.REPEAT_INFINITE_TIMES );

	InitFakeClientsProfiles();
}

HookReturnCode OnClientPutInServer( CBasePlayer@ pPlayer )
{
	if ( !g_bFirstPlayerConnected )
	{
		g_bFirstPlayerConnected = true;

		g_Scheduler.SetTimeout("SpawnFakeClients", 0.1f);
		g_Scheduler.SetTimeout("UnstuckFakeClients", 0.5f);
	}

	return HOOK_CONTINUE;
}

// Misc. shit

uint64 random = 1;
bool g_bFirstPlayerConnected = false;

int rand()
{
    random = random * 1103515245 + 12345;
    int mda = int(random / 65536) % 32768;

	// kak blyat
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