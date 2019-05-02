library(tibble)
library(dplyr)

ep.df <- as_tibble(read.csv("data/Episodes.csv",stringsAsFactors=FALSE))

t.epchar <- readRDS('data/taverndata.RDS')[["all_eps_char"]]

ep.list <- list()

for(i in 1:nrow(ep.df)){
  tmp.row <- ep.df[i,]
  
  tmp.col.1 <- c("Episode","Name","Date","Length")
  tmp.col.2 <- c(paste0("Season ",
                        as.character(tmp.row[,3]),
                        ", Episode ",
                        as.character(tmp.row[,4])),
                 as.character(tmp.row[,5]),
                 as.character(tmp.row[,6]),
                 as.character(tmp.row[,7]))
  
  tmp.df <- tibble("COL1"=tmp.col.1,
                   "COL2"=tmp.col.2)
 
  tmp.ep.char <- t.epchar %>% 
    filter(EPID==as.character(tmp.row[,2])) %>% 
    mutate(COL1=ifelse(row_number()==1,
                       "Characters",
                       "")) %>% 
    rename(COL2=Character) %>% 
    select(COL1,COL2)
  
  tmp.df <- rbind(tmp.df,tmp.ep.char)
  
  ep.list[[as.character(tmp.row[,2])]] <- tmp.df
}

eps <- ep.df %>% 
  select(EPID,Season,Episode,Date)

ep.list[["eplist"]] <- eps

saveRDS(ep.list,file="data/epdata.RDS")
