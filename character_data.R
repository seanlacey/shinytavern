library(tibble)
library(dplyr)

char.df <- as_tibble(read.csv("data/Characters.csv",stringsAsFactors=FALSE))

char.list <- list()

for(i in 1:nrow(char.df)){
  tmp.row <- char.df[i,]
  
  tmp.col.1 <- c("Name","Actor","Species","Occupation","Link")
  tmp.col.2 <- c(as.character(tmp.row[,2]),
                 as.character(tmp.row[,3]),
                 as.character(tmp.row[,4]),
                 as.character(tmp.row[,5]),
                 as.character(tmp.row[,6]))
  
  tmp.df <- tibble("COL1"=tmp.col.1,
                   "COL2"=tmp.col.2)
  
  char.list[[as.character(tmp.row[,1])]] <- tmp.df
}

###Adding unique items for various characters
# Usidore -----------------------------------------------------------------
char.list[["USI"]] <- char.list[["USI"]] %>% 
  add_row(COL1="Full Name",COL2="Usidore") %>% 
  add_row(COL1="",COL2="Wizard of the 12th Realm of Ephysiyies") %>% 
  add_row(COL1="",COL2="Master of Light and Shadow") %>% 
  add_row(COL1="",COL2="Manipulator of Magical Delights") %>% 
  add_row(COL1="",COL2="Devourer of Chaos") %>% 
  add_row(COL1="",COL2="Champion of the Great Halls of Terr'akkas") %>% 
  add_row(COL1="",COL2="The elves know him as Fi’ang Yalok") %>% 
  add_row(COL1="",COL2="The dwarves know him as Zoenen Hoogstandjes") %>% 
  add_row(COL1="",COL2="And he is known in the Northeast as Gaismunenas Meistar") %>% 
  add_row(COL1="",COL2="") %>% 
  add_row(COL1="Other Secret Names",COL2="") %>% 
  add_row(COL1="Known in Southern Foon as",COL2="Robert Evans") %>% 
  add_row(COL1="Known in Western Foon as",COL2="Solomander Pondu") %>% 
  add_row(COL1="Known in Hudson Valley as",COL2="Rip Van Magic Pants") %>% 
  add_row(COL1="Known in Fingaria as",COL2="Crip Cramble") %>% 
  add_row(COL1="Known Down Under as",COL2="Funkaroo") %>% 
  add_row(COL1="Known in Italiana as",COL2="Pasta Cortez") %>% 
  add_row(COL1="Known in the Great Halls of Terr'akkas as",COL2="Slippery") %>% 
  add_row(COL1="Known to the Wedding Planners as",COL2="Dale Sprinklesleeves") %>% 
  add_row(COL1="Known to the Gamblers of Chorroth as",COL2="Johann Sebastian Bacharach") %>% 
  add_row(COL1="Known to the Bakers as",COL2="Biscuit Meniscus") %>% 
  add_row(COL1="Known to the Real Estate Agents as",COL2="Rackloom") %>% 
  add_row(COL1="Known to the FML Announcers as",COL2="Aaron Grievance") %>% 
  add_row(COL1="Known to the Eagles as",COL2="Loosey Usi") %>% 
  add_row(COL1="Known to the Vampires as",COL2="Antony Dawnwalker") %>% 
  add_row(COL1="Known to the Pixies as",COL2="Frank Black or Black Francis") %>% 
  add_row(COL1="Known to the Goblins as",COL2="Hel'llacan'th'ethnth") %>% 
  add_row(COL1="Known to the Wolves as",COL2="Rooooorrrroooooooooooooooooooo! the Blue") %>% 
  add_row(COL1="Known to the Poultry as",COL2="Stinklefeather Wizzlebeard") %>% 
  add_row(COL1="Known to the Cows as",COL2="Hot Patootie") %>% 
  add_row(COL1="Known to Those on Crutches as",COL2="Teeny Tim") %>% 
  add_row(COL1="Known to the Taurs as",COL2="Dorfski") %>% 
  add_row(COL1="Known to the Whales of Califor as",COL2="OoooooooOOOOOOOoooosidore") %>% 
  add_row(COL1="Known to the Brownies as",COL2="Captain Happenstance") %>% 
  add_row(COL1="Known to the Mimics as",COL2="Ominous McIntyre") %>% 
  add_row(COL1="Known to the Brownies in Gratax as",COL2="Pants McGillicuddy") %>% 
  add_row(COL1="Known to the Bears as",COL2="Grizzly Wondertooth") %>% 
  add_row(COL1="Known to the Ducks as",COL2="Swivel Swightly") %>% 
  add_row(COL1="Known to the Trash Kan Kids as",COL2="Pappy Nonsense") %>% 
  add_row(COL1="Known to the Squirrel People of Dagadoom as",COL2="Mr. Ferris") %>% 
  add_row(COL1="Known to destroy everything in whatever town he's in as",COL2="Dubbel Rumpelskin") %>% 
  add_row(COL1="Known by the delicate, crumbly name",COL2="Pi Pi Poo") %>% 
  add_row(COL1="Known as",COL2="Baggle Me Fingles") %>% 
  add_row(COL1="Known as",COL2="Papa Mache") %>% 
  add_row(COL1="Known as",COL2="Brach Zaff") %>% 
  add_row(COL1="Known as",COL2="Tippercanoe") %>% 
  add_row(COL1="Known as",COL2="Tyler") %>% 
  add_row(COL1="Known to Jamillious Washington the Mauve as",COL2="Phil Jacksonious") %>% 
  add_row(COL1="Known to become a woman and teach math at the University of Phoenix as",COL2="Susan Doku") %>% 
  add_row(COL1="Known to the blades of grass as",COL2="Johnny Downstream") %>% 
  add_row(COL1="Known to make grass jump out of the ground and run away as",COL2="The Grassy One") %>% 
  add_row(COL1="Known as",COL2="Mister Yuagi") %>% 
  add_row(COL1="Known as",COL2="Soda Poppin' Daddy") %>% 
  add_row(COL1="Known as",COL2="Leverly B'Angelo") %>% 
  add_row(COL1="Known as",COL2="Cyanmancer Thundercrust") %>% 
  add_row(COL1="Known to read ads as",COL2="Usidore the Blue Apron") %>% 
  add_row(COL1="Known as",COL2="Disco Patterson") %>% 
  add_row(COL1="Known as",COL2="Cyanmancer Thundercrust") %>% 
  add_row(COL1="Known as",COL2="Zoltar Biggius") %>% 
  add_row(COL1="Known as",COL2="Azure Sack") %>% 
  add_row(COL1="Known as",COL2="Toby LeRone") %>% 
  add_row(COL1="Known as",COL2="Wheeeee") %>% 
  add_row(COL1="Known as",COL2="Heathcliff") %>% 
  add_row(COL1="Known as",COL2="Taft Backwater") %>% 
  add_row(COL1="Known as",COL2="Sleepy LaBeef") %>% 
  add_row(COL1="Known as",COL2="Pleasure Herrera")

# Spintax -----------------------------------------------------------------
char.list[["SPTX"]] <- char.list[["SPTX"]] %>% 
  add_row(COL1="Full Name",COL2="Spintax the Green") %>% 
  add_row(COL1="",COL2="Wizard of the Third, Ninth, and Twelfth Realms of Ephysiyies") %>% 
  add_row(COL1="",COL2="Wielder of Arcane Forces Compelling the Living and the Dead") %>% 
  add_row(COL1="",COL2="Diviner of Unknowable Truths") %>% 
  add_row(COL1="",COL2="Caster of Illusions") %>% 
  add_row(COL1="",COL2="Destroyer of Lies") %>% 
  add_row(COL1="",COL2="Dissolver of the Wall of Fire") %>% 
  add_row(COL1="",COL2="Imbiber of the Nine Deadly Poisons") %>% 
  add_row(COL1="",COL2="Author of the Pandenomicon") %>% 
  add_row(COL1="",COL2="Winner of the Wizard's Choice Award") %>% 
  add_row(COL1="",COL2="The dwarves know him as Nickelback Silverchair") %>% 
  add_row(COL1="",COL2="The angels know him as Mama Cassai'el") %>% 
  add_row(COL1="",COL2="The vampires know me as Cameron Orlando") %>% 
  add_row(COL1="",COL2="And known in the south as Lodestone Greatcraft")

# Jyn'Leeviyah -----------------------------------------------------------------
char.list[["JTR"]] <- char.list[["JTR"]] %>% 
  add_row(COL1="Full Name",COL2="Jyn'Leeviyah") %>% 
  add_row(COL1="",COL2="Wizard of the Sixth Realm of Ephysiyies") %>% 
  add_row(COL1="",COL2="Mistress of Nature and Nurture") %>% 
  add_row(COL1="",COL2="Reviver of the Springs of Gu'uthmagit") %>% 
  add_row(COL1="",COL2="Seer of the Prophecies of the Temziet Mists") %>% 
  add_row(COL1="",COL2="Keeper of the Sacre Tome of Deyfral") %>% 
  add_row(COL1="",COL2="Two-time Wizard's Choice Award nominee") %>% 
  add_row(COL1="",COL2="The elves know her as Perimmain So'it'thuri") %>% 
  add_row(COL1="",COL2="The vampires know her as Beyonce Bloodlust") %>% 
  add_row(COL1="",COL2="The tree folk know her as Opal Vinewitch") %>% 
  add_row(COL1="",COL2="And upon the isle of Meegas she is known as Ukkosta Kassvista")


# Jamillious --------------------------------------------------------------
char.list[["JTM"]] <- char.list[["JTM"]] %>% 
  add_row(COL1="Full Name",COL2="Jamillious Washington") %>% 
  add_row(COL1="",COL2="Bringer of Feast and Famine") %>% 
  add_row(COL1="",COL2="Master of the Great Plantation") %>% 
  add_row(COL1="",COL2="Shatterer of the Triangle Trade Winds") %>% 
  add_row(COL1="",COL2="The dwarves know him as Dat Dude") %>% 
  add_row(COL1="",COL2="The elves know him as Always Holdin'") %>% 
  add_row(COL1="",COL2="And he is known in the Far South as Boy") %>% 
  add_row(COL1="",COL2="") %>% 
  add_row(COL1="Other Secret Names",COL2="") %>% 
  add_row(COL1="Known to the badgers as",COL2="Jamillious the Realest") %>% 
  add_row(COL1="Known to the vampires as",COL2="My queen to be")
  

# Usidore the Black -------------------------------------------------------
char.list[["UTB"]] <- char.list[["UTB"]] %>% 
  add_row(COL1="Full Name",COL2="Usidore") %>% 
  add_row(COL1="",COL2="Emissary of the Dark Lord of Foon") %>% 
  add_row(COL1="",COL2="Fallen Wizard of the Realms of Ephysiyies") %>% 
  add_row(COL1="",COL2="Sorcerer Bound of the Gylothian Clan") %>% 
  add_row(COL1="",COL2="Sourge of the Battle of the Thirteen Armies") %>% 
  add_row(COL1="",COL2="Immolator of the Wall of Fire") %>% 
  add_row(COL1="",COL2="Disembowler of the Great Dragon Krazevesky") %>% 
  add_row(COL1="",COL2="Defacer of the Great Halls of Terr'akkas") %>% 
  add_row(COL1="",COL2="The fairfolk know him as Fairfy Usolo") %>% 
  add_row(COL1="",COL2="The orcs know him as Toomsas Naysayja") 
  

# Twosidore ---------------------------------------------------------------
char.list[["TWO"]] <- char.list[["TWO"]] %>% 
  add_row(COL1="He Dead?",COL2="He Dead.")


# Blemish -----------------------------------------------------------------
char.list[["BLEM"]] <- char.list[["BLEM"]] %>% 
  add_row(COL1="He Dead?",COL2="He Dead.")

# Vlad -----------------------------------------------------------------
char.list[["VLAD"]] <- char.list[["VLAD"]] %>% 
  add_row(COL1="He Dead?",COL2="He Dead.")

# Brad -----------------------------------------------------------------
char.list[["BRAD"]] <- char.list[["BRAD"]] %>% 
  add_row(COL1="He Dead?",COL2="He Dead.")

# Chad -----------------------------------------------------------------
char.list[["VCHD"]] <- char.list[["VCHD"]] %>% 
  add_row(COL1="He Dead?",COL2="He Dead.")

# Tad -----------------------------------------------------------------
char.list[["TAD"]] <- char.list[["TAD"]] %>% 
  add_row(COL1="He Dead?",COL2="He Dead.")

# Thorn -----------------------------------------------------------------
char.list[["THRN"]] <- char.list[["THRN"]] %>% 
  add_row(COL1="He Dead?",COL2="He Dead.")

# Tomblain ----------------------------------------------------------------
char.list[["TOM"]] <- char.list[["TOM"]] %>% 
  add_row(COL1="Aliases",COL2="Tom the Traveler") %>% 
  add_row(COL1="",COL2="Grumblewald Shimbershwitz") %>% 
  add_row(COL1="",COL2="D'Angelo Capricious") %>% 
  add_row(COL1="",COL2="Hank") %>% 
  add_row(COL1="",COL2="Lady Eliza Parts") %>% 
  add_row(COL1="",COL2="A Series of Bats") %>% 
  add_row(COL1="Current Partner",COL2="Alice P. Corn")

# Acorn -------------------------------------------------------------------
char.list[["ACRN"]] <- char.list[["ACRN"]] %>% 
  add_row(COL1="Current Partner",COL2="Tomblain Belaroth")


# Arnie -------------------------------------------------------------------
char.list[["AN"]] <- char.list[["AN"]] %>% 
  add_row(COL1="Shirt Color",COL2="Pink") %>% 
  add_row(COL1="Sex with a memory gremlin?",COL2="Yes") %>% 
  add_row(COL1="Desire to talk about earth stuff",COL2="None") %>% 
  add_row(COL1="Math Ability (1-10)",COL2="Low")


# Chunt -------------------------------------------------------------------
char.list[["CHU"]] <- char.list[["CHU"]] %>% 
  add_row(COL1="Current Form",COL2="Badger") %>% 
  add_row(COL1="Past Forms",COL2="Goat") %>% 
  add_row(COL1="",COL2="Spider") %>% 
  add_row(COL1="",COL2="Cricket") %>% 
  add_row(COL1="",COL2="Bear") %>% 
  add_row(COL1="",COL2="Vampire Bat") %>% 
  add_row(COL1="",COL2="Eagle") %>% 
  add_row(COL1="",COL2="Caterpillar") %>% 
  add_row(COL1="",COL2="Cat") %>% 
  add_row(COL1="",COL2="Tiny Horse with Two Buttholes") %>% 
  add_row(COL1="",COL2="Regular Horse") %>% 
  add_row(COL1="",COL2="Worm") %>% 
  add_row(COL1="",COL2="Squirrel") %>% 
  add_row(COL1="",COL2="Hare") %>% 
  add_row(COL1="",COL2="Seal") %>% 
  add_row(COL1="",COL2="Ant") %>% 
  add_row(COL1="",COL2="Crocodile") %>% 
  add_row(COL1="",COL2="Owl") %>% 
  add_row(COL1="",COL2="Flamingo") %>% 
  add_row(COL1="",COL2="Raven") %>% 
  add_row(COL1="",COL2="Gorilla") %>% 
  add_row(COL1="",COL2="Oyster") %>% 
  add_row(COL1="",COL2="Starling") %>% 
  add_row(COL1="",COL2="Whale") %>% 
  add_row(COL1="",COL2="Kangaroo") %>% 
  add_row(COL1="",COL2="Ostrich") %>% 
  add_row(COL1="",COL2="") %>% 
  add_row(COL1="Catchphrases",COL2="Aw yeah baby!") %>% 
  add_row(COL1="",COL2="Bing Bong!") %>% 
  add_row(COL1="",COL2="Get Wet!") %>% 
  add_row(COL1="",COL2="Chunt's up with that?") %>% 
  add_row(COL1="",COL2="Lil' Squishin' It!") %>% 
  add_row(COL1="",COL2="Mmmm Chunt please!") %>% 
  add_row(COL1="",COL2="Cor Blimey!")

# Momo --------------------------------------------------------------------
char.list[["MOMO"]] <- char.list[["MOMO"]] %>% 
  add_row(COL1="Current Partner",COL2="Mayor Manana")

# Cockroach Clown ---------------------------------------------------------
char.list[["CLWN"]] <- char.list[["CLWN"]] %>% 
  add_row(COL1="Make-up",COL2="Clown")

# Flower ------------------------------------------------------------------
char.list[["FLW"]] <- char.list[["FLW"]] %>% 
  add_row(COL1="Drink of Choice",COL2="Full-Bodied Red Wine")

saveRDS(char.list,file="data/chardata.RDS")

