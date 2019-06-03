 -- **********************************
-- author: francogp
-- **********************************

local MOD_ID = "Hydrocraft";
local MOD_NAME = "Hydrocraft 3D weapon models";
local MOD_VERSION = "0.2";
local MOD_AUTHOR = "FrancoGP";

isHydrocraft3DWeaponLoaded = false;

local function load3Dmodels()
        
        -- The directory of the mod folder.
        dir = getDir(MOD_ID);
        print("***** Mod Loaded Dir: " .. dir);
        -- quick extension strings.
        em = ".txt";
        et = ".png";
        
        -- MODEL LOADING --
        name = "HCWifflebat";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_" .. name .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCAluminiumbat";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_" .. name .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBaseballbatbarbedwire";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel"  .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBaseballbatcutter";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBaseballbattrimmer";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBaseballbatwrench";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_wrenchwood" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
            
        ---------------------------
        name = "HCSlingshot";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;    
        ---------------------------
        name = "HCTireiron";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;    
        ---------------------------
        name = "HCSteelpipe";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;        
        ---------------------------
        name = "HCBaton";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        ---------------------------
        name = "HCSurvivalaxe";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        ----------------------------
		name = "HCLumberaxe";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        ----------------------------
		name = "HCSawbladeaxe";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        ----------------------------		
        name = "HCStake";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        ---------------------------
        name = "HCNailgun";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_" .. name .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCPickaxe";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCCane";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        ---------------------------
        name = "HCQuarterstaff";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
            
        ---------------------------
        name = "HCLongbow";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCCrossbow";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCCombatknife";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCMeatcleaver";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCMachete";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCKatana";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_" .. name .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCBastardswordcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCBastardsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBastardswordsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCBastardsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBastardswordiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCBastardsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBastardswordbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCBastardsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCBattleaxecopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCBattleaxe" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBattleaxesteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCBattleaxe" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBattleaxeiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCBattleaxe" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCBattleaxebronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCBattleaxe" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCSpikedflailcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedflail" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpikedflailsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedflail" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpikedflailiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedflail" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpikedflailbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedflail" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
            
        ---------------------------
        name = "HCDaggercopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCDagger" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCDaggersteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCDagger" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCDaggeriron";
        locationModel = dir .. "/media/models/" .. "weapons_HCDagger" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCDaggerbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCDagger" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCGreatswordcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCGreatsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCGreatswordsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCGreatsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCGreatswordiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCGreatsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCGreatswordbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCGreatsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCHalberdcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCHalberd" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodlongcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCHalberdsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCHalberd" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodlongsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCHalberdiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCHalberd" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodlongiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCHalberdbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCHalberd" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodlongbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCHatchetcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCHatchet" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCHatchetsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCHatchet" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCHatchetiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCHatchet" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCHatchetbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCHatchet" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCKnifecopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCKnife" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCKnifesteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCKnife" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCKnifeiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCKnife" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCKnifebronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCKnife" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCLongswordcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCLongsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCLongswordsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCLongsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCLongswordiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCLongsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCLongswordbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCLongsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCShortswordcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCShortsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCShortswordsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCShortsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCShortswordiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCShortsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCShortswordbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCShortsword" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
            
        ---------------------------
        name = "HCSicklecopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCSickle" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSicklesteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCSickle" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSickleiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCSickle" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSicklebronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCSickle" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCSmithyhammercopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCSmithyhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSmithyhammersteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCSmithyhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSmithyhammeriron";
        locationModel = dir .. "/media/models/" .. "weapons_HCSmithyhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSmithyhammerbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCSmithyhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCSpearcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpear" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpearsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpear" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpeariron";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpear" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpearbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpear" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCSpearobsidian";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpear" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodobsidian" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpearstone";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpear" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodstone" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCSpikedmacecopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedmace" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpikedmacesteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedmace" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpikedmaceiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedmace" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCSpikedmacebronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCSpikedmace" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCTridentcopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCTrident" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCTridentsteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCTrident" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCTridentiron";
        locationModel = dir .. "/media/models/" .. "weapons_HCTrident" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCTridentbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCTrident" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
            ---------------------------
        name = "HCWarhammercopper";
        locationModel = dir .. "/media/models/" .. "weapons_HCWarhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodcopper" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCWarhammersteel";
        locationModel = dir .. "/media/models/" .. "weapons_HCWarhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCWarhammeriron";
        locationModel = dir .. "/media/models/" .. "weapons_HCWarhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        name = "HCWarhammerbronze";
        locationModel = dir .. "/media/models/" .. "weapons_HCWarhammer" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodbronze" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCMonkeywrench";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_wrenchwood" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCWrench";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
            ---------------------------
        name = "HCCrutch";
        locationModel = dir .. "/media/models/" .. "weapons_HCCrutch" .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodobsidian" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
            ---------------------------
        name = "HCCrutchaluminium";
        locationModel = dir .. "/media/models/" .. "weapons_HCCrutch"  .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponsteel" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
         ---------------------------
        name = "HCRake";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodiron" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCPushbroom";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_broom" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCBroom";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_broom" .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCPotatocannon";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_" .. name .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCFlailstone";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_weaponwoodstone"  .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
        
        ---------------------------
        name = "HCHedgetrimmer";
        locationModel = dir .. "/media/models/" .. "weapons_" .. name .. em;
        locationTexture = dir .. "/media/textures/" .. "Objects_" .. name .. et;
        --                    (model name        , modelLocation, textureLocation )
        loadStaticZomboidModel("weapons_" .. string.lower(name), locationModel, locationTexture ) ;
    
        isHydrocraft3DWeaponLoaded = true;    
        
    
end    

Events.OnGameBoot.Add(load3Dmodels); 