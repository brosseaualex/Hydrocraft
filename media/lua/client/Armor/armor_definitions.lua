--Body Parts List --> Foot_L, Foot_R, ForeArm_L, ForeArm_R, Groin, Hand_L, Hand_R, Head, LowerLeg_L, LowerLeg_R, MAX, Neck, Torso_Lower, Torso_Upper, UpperArm_L, UpperArm_R, UpperLeg_L, UpperLeg_R 
--Available Res Types list --> ScratchRes|DeepWoundRes|BurnRes|BulletRes|FractureRes|GlassRes|BiteRes

if(GlobalArmor == nil) then GlobalArmor = {} end

-- Helmets	
	local WorkingArmor;
	

	WorkingArmor = "HCHardhat";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
	
	WorkingArmor = "WeldingMask";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "HCHockeymask";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "HCHelmfootball";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "HCHelmbike";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 50};	
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "HCHelmmotorcycle";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "HCFirefighterhelmet";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "HCHelmkevlar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "HCHelmswat";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 90;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "HCHelmriot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "HCHelmsamurai";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};		
		GlobalArmor[WorkingArmor]["Durability"] = 35;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "HCHelmsteel";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "HCHelmiron";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "HCHelmbronze";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "HCHelmcopper";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Head";	
		
	WorkingArmor = "HCHelmcookingpot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;	
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "HCHelmbucket";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
-- Gloves

	WorkingArmor = "HCOvenmitts";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 20, Hand_R = 20} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 20, Hand_R = 20};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";

	WorkingArmor = "HCWorkgloves";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 20, Hand_R = 20} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 20, Hand_R = 20};		
		GlobalArmor[WorkingArmor]["Durability"] = 5;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";

	WorkingArmor = "HCGardengloves";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 20, Hand_R = 20} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 20, Hand_R = 20};		
		GlobalArmor[WorkingArmor]["Durability"] = 4;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";		
		
	WorkingArmor = "HCGlovekevlar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 90, Hand_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";

	WorkingArmor = "HCGloveriot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 90, Hand_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 80;		
		GlobalArmor[WorkingArmor]["Location"] = "Hands";	
		
	WorkingArmor = "HCGlovechainmail";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 45;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";
		
	WorkingArmor = "HCGlovesteel";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";
		
	WorkingArmor = "HCGloveiron";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";

	WorkingArmor = "HCGlovebronze";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";

	WorkingArmor = "HCGlovecopper";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Hands";	
		
	WorkingArmor = "HCGlovestuddedleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 30, Hand_R = 30} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 30, Hand_R = 30} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 30, Hand_R = 30} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 30, Hand_R = 30};		
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Hands";

	WorkingArmor = "HCGloveleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 20, Hand_R = 20} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 20, Hand_R = 20};		
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Hands";	
		
	WorkingArmor = "HCGlovecord";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 20, Hand_R = 20} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 20, Hand_R = 20};		
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Hands";		
		
-- Arm Armor

	WorkingArmor = "HCArmarmorkevlar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_L = 90, UpperArm_R = 90};			
		GlobalArmor[WorkingArmor]["BurnRes"] = {UpperArm_L = 80, UpperArm_R = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorswat";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_L = 90, UpperArm_R = 90};			
		GlobalArmor[WorkingArmor]["BurnRes"] = {UpperArm_L = 80, UpperArm_R = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 90;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";	

	WorkingArmor = "HCArmarmorriot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_L = 90, UpperArm_R = 90};			
		GlobalArmor[WorkingArmor]["BurnRes"] = {UpperArm_L = 80, UpperArm_R = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";	
		
	WorkingArmor = "HCArmarmorpaintball";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 70;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";		
		
	WorkingArmor = "HCArmarmorsamurai";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 80, UpperArm_R = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 80, UpperArm_R = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 80, UpperArm_R = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 80, UpperArm_R = 80};	
		GlobalArmor[WorkingArmor]["Durability"] = 35;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorlamelar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 80, UpperArm_R = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 80, UpperArm_R = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 80, UpperArm_R = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 80, UpperArm_R = 80};	
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";
		
	WorkingArmor = "HCArmarmorsteel";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";
		
	WorkingArmor = "HCArmarmoriron";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorbronze";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorcopper";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorstuddedleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 30, UpperArm_R = 30};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 30, UpperArm_R = 30};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 30, UpperArm_R = 30};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 30, UpperArm_R = 30};	
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorhardenedleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 25, UpperArm_R = 25};	
		GlobalArmor[WorkingArmor]["Durability"] = 15;			
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 20, UpperArm_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 20, UpperArm_R = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 20, UpperArm_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 20, UpperArm_R = 20};	
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";
		
	WorkingArmor = "HCArmarmorhide";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 15, UpperArm_R = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 15, UpperArm_R = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 15, UpperArm_R = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 15, UpperArm_R = 15};	
		GlobalArmor[WorkingArmor]["Durability"] = 5;
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorpadded";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 15, UpperArm_R = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 15, UpperArm_R = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 15, UpperArm_R = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 15, UpperArm_R = 15};	
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";		

	WorkingArmor = "HCArmarmorbone";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 10, UpperArm_R = 10};	
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorbamboo";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 10, UpperArm_R = 10};	
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmorlog";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 10, UpperArm_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 10, UpperArm_R = 10};	
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";

	WorkingArmor = "HCArmarmortire";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 40, UpperArm_R = 40};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 40, UpperArm_R = 40};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 40, UpperArm_R = 40};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 40, UpperArm_R = 40};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";
		
	WorkingArmor = "HCArmarmorbubblewrap";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["Durability"] = 1;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";		
		
-- Torso Armor

	WorkingArmor = "HCFiresuit";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 90, Neck = 90, Torso_Upper = 90, Torso_Lower = 90, UpperArm_L = 90, UpperArm_R = 90, ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90, Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90, LowerLeg_L = 90, LowerLeg_R = 90, Foot_L = 90, Foot_R = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCFirefighterjacket";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 25, Torso_Upper = 25, UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 25, Torso_Upper = 25, UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 25, Torso_Upper = 25, UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 25, Torso_Upper = 25, UpperArm_L = 25, UpperArm_R = 25};		
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80, UpperArm_L = 80, UpperArm_R = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmormilitaryjacket";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 25, Torso_Upper = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 3;
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		
	WorkingArmor = "HCArmorleatherjacket";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 20, Torso_Upper = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorlightjacket";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";			

	WorkingArmor = "HCArmorkevlar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorswat";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 90;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";	
		
	WorkingArmor = "HCArmorriot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "HCArmorparamedic";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 75;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		
		
	WorkingArmor = "HCArmorpaintball";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 70;
		GlobalArmor[WorkingArmor]["Location"] = "Body";			

	WorkingArmor = "HCArmorchainmail";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorscalemail";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 35;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		
		
	WorkingArmor = "HCArmorsamurai";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 80, Torso_Upper = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 35;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		
	WorkingArmor = "HCArmorlamelar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 80, Torso_Upper = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 80, Torso_Upper = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 30;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		
	WorkingArmor = "HCArmorchainmail";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";	
		
	WorkingArmor = "HCArmorsteel";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmoriron";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorbronze";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";	
		
	WorkingArmor = "HCArmorcopper";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorstuddedleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 30, Torso_Upper = 30};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 30, Torso_Upper = 30};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 30, Torso_Upper = 30};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 30, Torso_Upper = 30};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorhardenedleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 25, Torso_Upper = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 15;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";	
		
	WorkingArmor = "HCArmorleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 20, Torso_Upper = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		
	WorkingArmor = "HCArmorhide";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorpadded";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorpadded";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorbone";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 10, Torso_Upper = 10};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorbamboo";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 10, Torso_Upper = 10};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorlog";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 10, Torso_Upper = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 10, Torso_Upper = 10};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "HCArmortire";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 40, Torso_Upper = 40};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		
	WorkingArmor = "HCArmorphonebooks";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 20, Torso_Upper = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "HCArmorbubblewrap";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 25, Torso_Upper = 25};		
		GlobalArmor[WorkingArmor]["Durability"] = 1;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

-- Leg Armor

	WorkingArmor = "HCJeans";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "HCLegarmorkevlar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "HCLegarmorswat";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 90;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "HCLegarmorriot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "HCLegarmorpaintball";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 70;		
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "HCLegarmorchainmail";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 45;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		
		
	WorkingArmor = "HCLegarmorscalemail";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 35;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		
					
	WorkingArmor = "HCLegarmorlamelar";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 80, Torso_Lower = 80, UpperLeg_L = 80, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 80, Torso_Lower = 80, UpperLeg_L = 80, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 80, Torso_Lower = 80, UpperLeg_L = 80, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 80, Torso_Lower = 80, UpperLeg_L = 80, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 30;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
	WorkingArmor = "HCLegarmorsamurai";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 80, Torso_Lower = 80, UpperLeg_L = 80, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 80, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 80, Torso_Lower = 80, UpperLeg_L = 80, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 80, Torso_Lower = 80, UpperLeg_L = 80, UpperLeg_R = 80};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 35;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
	WorkingArmor = "HCLegarmorsteel";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
	WorkingArmor = "HCLegarmoriron";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "HCLegarmorbronze";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "HCLegarmorcopper";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
	WorkingArmor = "HCLegarmorstuddedleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 30, Torso_Lower = 30, UpperLeg_L = 30, UpperLeg_R = 30};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 30, Torso_Lower = 30, UpperLeg_L = 30, UpperLeg_R = 30};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 30, Torso_Lower = 30, UpperLeg_L = 30, UpperLeg_R = 30};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 30, Torso_Lower = 30, UpperLeg_L = 30, UpperLeg_R = 30};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		
		
	WorkingArmor = "HCLegarmorhardenedleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 25, Torso_Lower = 25, UpperLeg_L = 25, UpperLeg_R = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 25, Torso_Lower = 25, UpperLeg_L = 25, UpperLeg_R = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 25, Torso_Lower = 25, UpperLeg_L = 25, UpperLeg_R = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 25, Torso_Lower = 25, UpperLeg_L = 25, UpperLeg_R = 25};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 15;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
	WorkingArmor = "HCLegarmorleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		

	WorkingArmor = "HCLegarmorhide";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 60, UpperLeg_R = 60};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
	WorkingArmor = "HCLegarmorpadded";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 70, UpperLeg_R = 70};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		

	WorkingArmor = "HCLegarmorbone";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
	WorkingArmor = "HCLegarmorlog";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		
		
	WorkingArmor = "HCLegarmortire";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 40, Torso_Lower = 40, UpperLeg_L = 40, UpperLeg_R = 40};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 40, Torso_Lower = 40, UpperLeg_L = 40, UpperLeg_R = 40};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 40, Torso_Lower = 40, UpperLeg_L = 40, UpperLeg_R = 40};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 40, Torso_Lower = 40, UpperLeg_L = 40, UpperLeg_R = 40};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 80, UpperLeg_R = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		

	WorkingArmor = "HCLegarmorbubblewrap";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 25, Torso_Lower = 25, UpperLeg_L = 25, UpperLeg_R = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 25, Torso_Lower = 25, UpperLeg_L = 25, UpperLeg_R = 25};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 90, UpperLeg_R = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
-- Boots

	WorkingArmor = "HCBootsteel";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {LowerLeg_L = 90, LowerLeg_R = 90, Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {LowerLeg_L = 90, LowerLeg_R = 90, Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {LowerLeg_L = 90, LowerLeg_R = 90, Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {LowerLeg_L = 90, LowerLeg_R = 90, Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {LowerLeg_L = 50, LowerLeg_R = 50, Foot_L = 50, Foot_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";

	WorkingArmor = "HCBootleather";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 20, Foot_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 20, Foot_R = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 20, Foot_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 20, Foot_R = 20};		
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";

	WorkingArmor = "HCBootcombat";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 90, Foot_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";

	WorkingArmor = "HCBootriot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 90, Foot_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 70;	
		GlobalArmor[WorkingArmor]["Location"] = "Feet";	
		
	WorkingArmor = "HCBootconstruction";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 50, Foot_R = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 50, Foot_R = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 50, Foot_R = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 50, Foot_R = 50};		
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";

	WorkingArmor = "HCCleats";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 10, Foot_R = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 10, Foot_R = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 10, Foot_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 10, Foot_R = 10};		
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Feet";		
		
	WorkingArmor = "HCBootcord";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 10, Foot_R = 10};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 10, Foot_R = 10};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 10, Foot_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 10, Foot_R = 10};		
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Feet";	
		
-- Shields
		
	WorkingArmor = "HCShieldriot";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
	
	WorkingArmor = "HCShieldsteel";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
		
	WorkingArmor = "HCShieldiron";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
		
	WorkingArmor = "HCShieldbronze";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
		
	WorkingArmor = "HCShieldcopper";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 10;
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
		
	WorkingArmor = "HCShieldwood";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
		
	WorkingArmor = "HCShieldtrashcanlid";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 80, ForeArm_L = 80, UpperArm_L = 80, Torso_Upper = 80, Torso_Lower = 80, Groin = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 35;
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
		

