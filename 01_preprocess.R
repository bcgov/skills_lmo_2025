# Copyright 2025 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

#libraries----------------------------
library(tidyverse)
library(here)
library(readxl)
library(janitor)
library(conflicted)
conflict_prefer("filter", "dplyr")
options(scipen = 999)
#functions
source(here("R", "functions.R"))

#rich's section-------------------------

#create some fake data
nobs <- 100000

fake_data <- tibble(category=1:3)|>
  mutate(value=map(category, function(x) rf(nobs, df1 = x, df2=10)),
         category=letters[category])|>
  unnest(value)

ggplot(fake_data, aes(x = category, y=value, fill=category)) +
  geom_jitter(shape = ".", alpha=.1)+
  geom_boxplot(aes(colour=category), outliers = FALSE, alpha=.25)+
  scale_y_continuous(trans="log10")+
  theme_minimal()+
  labs(x=NULL,
       y=NULL)

#ermias's section-------------------------







