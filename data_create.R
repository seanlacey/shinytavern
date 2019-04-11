library(dplyr)
library(lubridate)
library(magrittr)
library(tibble)

characters <- as_tibble(read.csv("data/Characters.csv"))
episodes <- as_tibble(read.csv("data/Episodes.csv"))
epchar <- as_tibble(read.csv("data/EpCharList.csv"))

characters$CHARID <- as.character(characters$CHARID)
epchar$CHARID <- as.character(epchar$CHARID)

episodes$Date <- as_date(episodes$Date)

###Should be same number obs as epchar. If not, check
join.1 <- inner_join(epchar,characters,by="CHARID")

all.eps.char <- inner_join(join.1,episodes,by="EPID")

rm(join.1)

#Character frequency
char.freq.tmp <- epchar %>%
                   group_by(CHARID) %>%
                   summarise(freq=n())

char.freq <- inner_join(characters,char.freq.tmp,by="CHARID") %>%
                mutate(word=Character,
                       scalefreq=ceiling(log(freq,2)+1)) %>%
                arrange(desc(scalefreq))
                
char.freq$word <- as.character(char.freq$word)



rm(char.freq.tmp)

###Initialize List
out.list <- list()

###Creating a list of all datasets along with the join.2 dataset
out.list[["characters"]] <- characters
out.list[["episodes"]] <- episodes
out.list[["epchar"]] <- epchar
out.list[["all_eps_char"]] <- all.eps.char
out.list[["char_freq"]] <- char.freq
out.list[["firstdate"]] <- min(episodes$Date)

saveRDS(out.list,file="data/taverndata.RDS")
