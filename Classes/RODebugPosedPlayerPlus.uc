
class RODebugPosedPlayerPlus extends RODebugPosedPlayer
	hidecategories(Lighting,LightColor,Force,Collision,Physics,Debug,Attachment,Navigation,Mobile)
	native
	placeable;

`define ppplog(msg) `log(`msg,,'PosedPlayerPlus')

enum PosesCommonEnum
{
	Hip_idle_rifle			<DisplayName=Standing Rifle>,
	Iron_idle_rifle			<DisplayName=Standing Rifle Aim>,
	JogF_rifle				<DisplayName=Standing Rifle Run>,
	Hip_idle_MG				<DisplayName=Standing MG>,
	JogF_MG					<DisplayName=Standing MG Run>,
	Hip_idle_pistol			<DisplayName=Standing Pistol>,
	Iron_idle_pistol		<DisplayName=Standing Pistol Aim>,
	jogF_pistol				<DisplayName=Standing Pistol Run>,
	Hip_idle_nade			<DisplayName=Standing Item>,
	Iron_idle_nade			<DisplayName=Standing Item Aim>,
	jogF_nade				<DisplayName=Standing Item Run>,
	CH_Hip_idle_rifle		<DisplayName=Crouch Rifle>,
	CH_Iron_idle_rifle		<DisplayName=Crouch Rifle Aim>,
	CH_Hip_idle_MG			<DisplayName=Crouch MG>,
	CH_Iron_idle_MG			<DisplayName=Crouch MG Aim>,
	CH_Hip_idle_pistol		<DisplayName=Crouch Pistol>,
	CH_Iron_idle_pistol		<DisplayName=Crouch Pistol Aim>,
	CH_Hip_idle_nade		<DisplayName=Crouch Item>,
	CH_Iron_idle_nade		<DisplayName=Crouch Item Aim>,
	Prone_Iron_idle_rifle	<DisplayName=Prone Rifle>,
	Prone_Iron_idle_MG		<DisplayName=Prone MG>,
	Prone_Iron_idle_pistol	<DisplayName=Prone Pistol>,
	prone_idle_nade			<DisplayName=Prone Item>
};

var()	editconst	string				Note;
var()	editconst	string				NotePackages;
var()				class<ROPawn>		PawnClass;
var()				string				PawnClassPackage;
var()				PosesCommonEnum		PosesCommon;
var()				string				PoseOverride;
var()				class<ROWeapon>		WeaponClass;
var()				string				WeaponClassPackage;

function string GetPawnType(bool bIsRS)
{
	local string retVal;
	
	`ppplog("Getting Pawn" @ PawnClass);
	
	if ( PawnClassPackage != "" )
	{
		retVal = PawnClassPackage $ "." $ string(PawnClass.name);
	}
	else if ( Left(PawnClass, 2) ~= "RS" )
	{
		retVal = "RSGameContent." $ string(PawnClass.name);
	}
	else if ( Left(PawnClass, 2) ~= "RO" )
	{
		retVal = "ROGameContent." $ string(PawnClass.name);
	}
	else
	{
		`ppplog("WARNING: Invalid Package! Returning Default Pawn" @ self.default.PawnClass);
		return string(self.default.PawnClass);
	}
	
	`ppplog("Returning Pawn:" @ retVal);
	return retVal;
}

function name GetPoseAnim()
{
	local string retVal;
	
	`ppplog("Getting Pose" @ PoseOverride);
	
	if ( PoseOverride != "" )
	{
		retVal = PoseOverride;
	}
	else
	{
		retVal = string(PosesCommon);
	}
	
	`ppplog("Returning Pose:" @ retVal);
	return name(retVal);
}

function string GetPoseWeapon(bool bIsRS)
{
	local string retVal;
	
	`ppplog("Getting Weapon" @ WeaponClass);
	
	if ( WeaponClassPackage != "" )
	{
		retVal = WeaponClassPackage $ "." $ string(WeaponClass.name);
	}
	else if ( Left(WeaponClass, 2) ~= "RS" )
	{
		retVal = "RSGameContent." $ string(WeaponClass.name);
	}
	else if ( Left(WeaponClass, 2) ~= "RO" )
	{
		retVal = "ROGameContent." $ string(WeaponClass.name);
	}
	else
	{
		`ppplog("WARNING: Invalid Package! Returning Default Weapon" @ self.default.WeaponClass);
		return string(self.default.WeaponClass);
	}
	
	`ppplog("Returning Weapon:" @ retVal);
	return retVal;
}

DefaultProperties
{
	Note=			"Any changes to Pawn/Weapon/Pose in above RODebugPosedPlayer tab will be ignored, use these ones only."
	NotePackages=	"If you are using custom classes, enter the package name where specified. Otherwise leave those fields blank."
	PawnClass=		"ROGameContent.ROAlliedPawnLevel1Rifleman"
	WeaponClass=	"ROGameContent.ROWeap_MN9130_Rifle_Content"
}
