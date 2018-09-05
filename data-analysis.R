library("tidyverse")
str(surveys)
select(surveys,species_id,weight)
filter(surveys, year==1995)
#pipes

surveys %>%  
  
  filter(year==1995) %>% 
select(species_id,weight)


exercise <- surveys %>% 
  filter(weight< 5)%>% 
  select(species_id,sex,weight)

#create new column
#mutate()

data_with_kg <- surveys %>% 
  mutate(weight_kg=weight/1000)

surveys %>% 
  mutate(weight_kg=weight/1000,weight_kg*2)

surveys %>% 
  mutate(weight_kg=weight/1000,weight_kg*2) %>% 
  head()

surveys %>% 
  mutate(weight_kg=weight/1000,weight_kg*2) %>% 
  head(n=10)

new_name <- surveys%>% 
  filter(!is.na(weight)) %>% mutate(weight_kg=weight/1000,weight_kg*2)
  nrow(new_name)

surveys %>% 
  group_by(sex) %>% 
  summarise(mean_weight=mean(weight,na.rm=TRUE))
  
surveys %>% 
  filter(!(sex=="")) %>% 
  group_by(sex) %>% 
  summarise(mean_weight=mean(weight,na.rm=TRUE))


summarise_two <-surveys %>% 
  filter(!sex=="") %>% 
  filter(!is.na(weight))%>% 
  group_by(sex,species_id)%>% 
  summarise(mean_weight=mean(weight))

  
summarise_three <-surveys %>% 
  filter(!sex=="") %>% 
  filter(!is.na(weight))%>% 
  group_by(sex,species_id)%>% 
  summarise(mean_weight=mean(weight),min_weight=min(weight),max_weight=max(weight))

#counting
surveys %>% 
  filter(!sex=="") %>%
  count(sex,species)

#sort (arrange())
surveys %>% 
  filter(!sex=="") %>%
  count(sex,species) %>% 
  arrange(species,desc(n))


