require "Reloading/ISReloadManager"
require "Reloading/ISReloadUtil"

--Nail clip for advanced unloading.
local HCNailclip = { type = "HCNailclip",
moduleName = 'Hydrocraft',
reloadClass = 'ISReloadableMagazine',
clipType = 'HCNailclip',
ammoType = 'HCNailgunammo',
shootSound = 'none',
clickSound = nil,
ejectSound = 'none',
insertSound = 'stormyRevolverInsertRound',
rackSound = 'stormyRevolverInsertRound',
containsClip = 0,
maxCapacity = 10,
reloadTime = 30,
rackTime = 10};

--Nailgun definition.
local HCNailgun = { type = "HCNailgun",
moduleName = 'Hydrocraft',
reloadClass = 'ISSemiAutoWeapon',
ammoType = 'HCNailclip',
clipName = 'Nail Clip',
clipIcon = 'HCNailclip',
shootSound = 'HCNailgunsound',
clickSound = 'stormy9mmClick',
ejectSound = 'stormy9mmClipEject',
insertSound = 'stormy9mmClipLoad',
rackSound = 'stormy9mmRack',
containsClip = 1,
rackTime = 10,
clipData = HCNailclip};

--Crossbow definition.
local HCCrossbow = { type = "HCCrossbow",
moduleName = 'Hydrocraft',
reloadClass = 'ISShotgunWeapon',
ammoType = 'HCXbowbolt',
shootSound = 'Bow_fire',
shootSoundPartial = nil,
clickSound = 'Bow_Dry2',
ejectSound = 'XBow_Loaded',
insertSound = 'XBow_Loading',
rackSound = 'XBow_Loading',
bulletOutSound = 'XBow_Loaded',
rackTime = 10};

--Longbow definition.
local HCLongbow = { type = "HCLongbow",
moduleName = 'Hydrocraft',
reloadClass = 'ISShotgunWeapon',
ammoType = 'HCArrow',
shootSound = 'Bow_fire',
shootSoundPartial = nil,
clickSound = 'Bow_Dry2',
ejectSound = 'XBow_Loading',
insertSound = 'stormyShotgunInsertRound',
rackSound = 'XBow_Loading',
bulletOutSound = nil,
rackTime = 10};

--Slingshot definition.
local HCSlingshot = { type = "HCSlingshot",
moduleName = 'Hydrocraft',
reloadClass = 'ISShotgunWeapon',
ammoType = 'HCBB',
rackSound = nil,
shootSound = 'Bow_Dry2',
shootSoundPartial = nil,
clickSound = 'Bow_Dry',
insertSound = 'stormyShotgunInsertRound',
maxCapacity = 1,
rackTime = 10,
bulletOutSound = nil};

--Sling definition.
local HCSling = { type = "HCSling",
moduleName = 'Hydrocraft',
reloadClass = 'ISShotgunWeapon',
ammoType = 'Stone',
rackSound = nil,
shootSound = 'Bow_Dry2',
shootSoundPartial = nil,
clickSound = 'Bow_Dry',
insertSound = 'stormyShotgunInsertRound',
maxCapacity = 1,
rackTime = 10,
bulletOutSound = nil};

--Potato gun definition.
local HCPotatocannon = { type = "HCPotatocannon",
moduleName = 'Hydrocraft',
reloadClass = 'ISShotgunWeapon',
ammoType = 'Potato',
rackSound = nil,
shootSound = 'PotatoShot',
shootSoundPartial = nil,
insertSound = 'PotatoLoad',
clickSound = 'PotatoEmpty',
maxCapacity = 1,
reloadTime = 80,
rackTime = 10};

ReloadUtil:addWeaponType(HCNailgun)
ReloadUtil:addMagazineType(HCNailclip)
ReloadUtil:addWeaponType(HCCrossbow)
ReloadUtil:addWeaponType(HCLongbow)
ReloadUtil:addWeaponType(HCSlingshot)
ReloadUtil:addWeaponType(HCSling)
ReloadUtil:addWeaponType(HCPotatocannon)