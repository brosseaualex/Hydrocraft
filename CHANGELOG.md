# Hydrocraft Changelog

## [11.1] - 2019-08-16
### LUA Changes
- Added Hemp to Potted Planting
- Added Beer Can Packs, Jello Mold, Large Can of Coffee, Alcoholic Beverages Cookbook, Coffee Filter Box to Item Distribution
- Increased Baking Tray, Electric Clamp, Coffee Filter spawn rate
- Fixed Honey Barrel not turning into Mead Barrel
- Juices can now only be made with Fresh fruits
- Reduced MRE Spawn and will give less MREs per box
- Fixed Cougar Hunting
- Small changes to farming code that will (hopefully) resolve rare cases of Hydrocraft crops breaking on server crash
- Removed remaining HCTireiron associations

### Added/Changed/Removed Recipes
- Bar/Drinks Overhaul - Need to read the Alcoholic Beverages Cookbook to learn recipes
- Rework of Irish Coffee recipes - now uses a Glass of Whiskey instead of whole bottle and does not use whole coffee recipient anymore
- Coffee Overhaul - New Large Can of Coffee item, can make Kettle of Coffee and pour into cups
- Renamed "Regular" Coffee (Coffee2) to Instant Coffee - Can make Instant Coffee directly with a Cup of Water
- Changed Katana sound - same sound as swords
- Increased Whipped Cream Can to 50 hunger
- Can now boil water in Canteens/Birch Bark cup
- Adjusted weight of Cookie Bags
- Making Gun Powder and base game bullets now require Gunsmithing Book
- Added nutritional value to Classic Canned Soup
- Added "Empty" Container for food recipes
- Added Chocolate and Vanilla pudding recipes
- Added Pipe recipes with Pipe molds
- Added Make Metal Bar recipes
- Added Bar Mold item & recipe
- Added Craftable Windows & Windshields
- Added Empty Ink Well & Ink Well recipes along with the recycle recipe
- Added Quill item & recipe & icon
- Added Recycle Aluminum (Empty Propane Tank) recipe
- Added All Pallet of Ingots - Pack / Unpack recipes
- Added dismantle recipe for Iron & Steel Pulleys
- Added Recycle Recipes from Iron Wheel & Steel Wheel
- Added Scrap Aluminum & Scrap Plastic & Scrap Rubber and respective recycle recipes
- Added Dismantling for Scissor Lift, Fork Lift, Van de Graff, SteplAddeder and Copy Machine
- Added Copy Machine with Generator item & recipe / Added Return Generator from Copy Machine with Generator recipe
- Added Brass Sheet & Brass Scrap and its respective craft and recycle recipes
- Added Rubber Belt item & recycle recipe
- Added Pallets of Steel Sheet, Copper Sheet, Rubber Sheet, Tin Sheet, Iron Sheet, Metal Bars, Aluminum Pipes items and their respective recipes
- Added Dismantling for Pallet Truck, Toy Wagon, Hand Dolly, Shopping Cart, Push Cart, Glove Box, Lawn Mower, Radiator, Projector, Bed Strings
- Added Coffee Filter Box
- Added Custom Smoking Sound (Thanks jiggawutt!)
- Removed PVC pipes to steel recipe
- Removed "Cut Steel Pipes" book recipes
- Removed 2 old recipes in Welding Textbook (Construct Barricades)
- Removed Hot Cuppa recipes and items (replaced by new Coffees)

### Fixed Recipes
- Fixed Jar Homemade Yogurt Recipe
- Fixed Empty Baking Tray Recipe (Wrong name for Baking Tray with Fruit)
- Fixed Make Homemade Pancake Batter Recipe
- Fixed sounds when breaking Wood/Metal items (knives etc.)
- Fixed Grits and Cheesy Grits "Make bowl" recipe
- Fixed Juice packet not being used when Mixing MRE drink
- Fixed SmithingMag4 not returning correct magazine after reading
- Fixed Typo in Boredom value of HCMREmeal and HCMREmealside

### Art Changes
- Added 2x Chicken Coop
- Added 2x Gardening Bench
- Added 2x Oil Press
- Added 2x Dissection Table 
- Added 2x Grind Stone
- Added 2x Stonewheel
- Added Homemade, Chocolate Chip Cookie, White Chocolate Cookie Trays
- Fixed size of Workbenches, MRE Pallets and various other textures
- Fixed broken icon on Empty Evaporated Milk - Also properly named
- Renamed Pies, Pumpkin Bread icons to change state properly when Cooked

### Tested bug reports - No issues found (build 40.43)
- Problems with bullets boxes - Hydrocraft add recipes to make boxes of 9mm, .223, .308 and shotgun bullets - recipe to open the boxes are included in base game

## [11.0] - 2019-06-21
### LUA Changes
- Farming system revamp - crops do not stay in "Plowed Land" stage anymore
- ISCompassMenu errors happening when right-clicking a stack of items
- Attaching duct tape pouches and attaching/removing bags from dogs does not destroy content anymore (Thanks to tommysticks)
- Added Jello Mix to Kitchen Counters and Supermarket Shelves Distributions
- Added some missing translations for Trellis Farming
- Recycling bags does not destroy content anymore

### Added/Changed/Removed Recipes
- Can now recycle 5 Unusable Metal into 1 Aluminum Ingot
- Can now empty all Wooden Bucket when there is something in it
- Integrated base game Metal Sheets into HC and removed duplicate sheets - renamed all to Aluminum Sheets
- Integrated base game Plastic Pipes to replace PVC Pipes and removed original HC PVC Pipe, still called PVC Pipe
- Can make Hydrocraft Pasta in Cooking Pots
- Reduced Dark Chocolate to 20 hunger
- Revamped MREs, also increased spawn locations and quantity (still rare)
- Removed Cut Steel Pipe Recipe as Pipes now properly handled by Hydrocraft (was giving Plastic Pipe)

### Fixed Recipes
- SheetPaper to SheetPaper2 Recipe
- Cat Food Open Recipe
- TeaBag to TeaBag2 Recipe
- Dried Cougar Hide Recipe Typo
- Plastic Knife Recipe Typo
- Soap to Soap2 Recipe Typo
- Cat Male Recipe
- Cookies Recipes
- Pizza Recipes
- Jello Recipes
- Fixed Mashed Potatoes Recipes
- Eating Potato Pancakes will now return the Cooking Pot
- Bread Recipes
- Lasagna Recipe
- Pastries Recipes
- Fixed missing capital letter in Meat Cleaver and Energy Bar
- Fixed Can of Whipped Cream - can now be refrigerated and does not rot at the beginning of the game
- Fixed CanBeDoneFromFloor from various Recycle Recipes
- Fixed Could not open Canned Cheese Sauce
- Fixed Soup Recipes
- Fixed Spirulina Powder Recipe - can now obtain powder by grinding it into a Mortar & Pestle (powder has no purpose at the moment)
- Pies Recipes
- Tomato sauce recipe now returns cooking pot
- Dried Fruits Recipes
- Jam Recipes
- Jarred Fruits Recipes
- Mexican Food
- Typos in Canned Food (Cannned)
- Fixed Mixed Candy throwing stack trace errors

### Tested bug reports - No issues found (build 40.43)
- Fishing with custom insects and food seems not to work properly and gives errors.
- (Tested MP) Sleeping in a tent, sleeping bag and car working on Zomboid 40.43
- (Tested MP) Timer on animals does not seem to work (Working - cell has to be loaded) - found rogue character in file which "might" resolve some issues
