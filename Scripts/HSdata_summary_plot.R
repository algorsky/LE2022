library(tidyverse)
library(janitor)
library(ggplot2)

## Load HS data

################################################################################

DESIS_buoy <- read.csv('Data/DESIS/DESIS_stats_buoy.csv') %>%
  select(c(date, contains("avg"))) %>%
  t() %>%
  row_to_names(row_number = 1)
DESIS_bands <- read.csv('Data/DESIS/DESIS_Bands.csv')
DESIS_buoy <- cbind(DESIS_bands,DESIS_buoy)
DESIS_buoy_long <- DESIS_buoy %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")
DESIS_buoy_long$Wavelength_nm <- as.integer(DESIS_buoy_long$Wavelength_nm)
DESIS_buoy_long$Rrs <- as.numeric(DESIS_buoy_long$Rrs)
DESIS_buoy_long_clean <- DESIS_buoy_long[!is.na(as.numeric(DESIS_buoy_long$Rrs)), ] 

DESIS_buoy_long_clean %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(450,800) +
  ylim(0,0.025) +
  labs(title='DESIS buoy-clipped mean spectra')

ggsave("Data/DESIS/DESIS_buoy_avg_spectra.png")

################################################################################

DESIS_lake <- read.csv('Data/DESIS/DESIS_stats_lake.csv') %>%
  select(c(date, contains("avg"))) %>%
  t() %>%
  row_to_names(row_number = 1)
DESIS_bands <- read.csv('Data/DESIS/DESIS_Bands.csv')
DESIS_lake <- cbind(DESIS_bands,DESIS_lake)
DESIS_lake_long <- DESIS_lake %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")
DESIS_lake_long$Wavelength_nm <- as.integer(DESIS_lake_long$Wavelength_nm)
DESIS_lake_long$Rrs <- as.numeric(DESIS_lake_long$Rrs)
DESIS_lake_long_clean <- DESIS_lake_long[!is.na(as.numeric(DESIS_lake_long$Rrs)), ] 

DESIS_lake_long_clean %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(450,800) +
  ylim(0,0.025) +
  labs(title='DESIS lake-clipped mean spectra')

ggsave("Data/DESIS/DESIS_lake_avg_spectra.png")

################################################################################

PRISMA_buoy <- read.csv('Data/PRISMA/PRISMA_stats_buoy.csv') %>%
  select(c(date, contains("avg"))) %>%
  t() %>%
  row_to_names(row_number = 1)
PRISMA_bands <- read.csv('Data/PRISMA/PRISMA_Bands.csv')
PRISMA_buoy <- cbind(PRISMA_bands,PRISMA_buoy)
PRISMA_buoy_long <- PRISMA_buoy %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")
PRISMA_buoy_long$Wavelength_nm <- as.integer(PRISMA_buoy_long$Wavelength_nm)
PRISMA_buoy_long$Rrs <- as.numeric(PRISMA_buoy_long$Rrs)
PRISMA_buoy_long_clean <- PRISMA_buoy_long[!is.na(as.numeric(PRISMA_buoy_long$Rrs)), ] 

PRISMA_buoy_long_clean %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(450,800) +
  #ylim(0,1) +
  labs(title='PRISMA buoy-clipped mean spectra')

ggsave("Data/PRISMA/PRISMA_buoy_avg_spectra.png")



PRISMA_buoy <- read.csv('Data/PRISMA/PRISMA_stats_buoy.csv')
PRISMA_buoy <- PRISMA_buoy[2:8,]  
PRISMA_buoy <- PRISMA_buoy %>%
  select(c(date, contains("avg"))) %>%
  t() %>%
  row_to_names(row_number = 1)
PRISMA_bands <- read.csv('Data/PRISMA/PRISMA_Bands.csv')
PRISMA_buoy <- cbind(PRISMA_bands,PRISMA_buoy)
PRISMA_buoy_long <- PRISMA_buoy %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")
PRISMA_buoy_long$Wavelength_nm <- as.integer(PRISMA_buoy_long$Wavelength_nm)
PRISMA_buoy_long$Rrs <- as.numeric(PRISMA_buoy_long$Rrs)
PRISMA_buoy_long_clean <- PRISMA_buoy_long[!is.na(as.numeric(PRISMA_buoy_long$Rrs)), ] 

PRISMA_buoy_long_clean %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(450,750) +
  ylim(0,0.03) +
  labs(title='PRISMA buoy-clipped mean spectra - 2021-06-05 not shown')

ggsave("Data/PRISMA/PRISMA_buoy_avg_spectra_clean.png")

################################################################################

PRISMA_lake <- read.csv('Data/PRISMA/PRISMA_stats_lake.csv') %>%
  select(c(date, contains("avg"))) %>%
  t() %>%
  row_to_names(row_number = 1)
PRISMA_bands <- read.csv('Data/PRISMA/PRISMA_Bands.csv')
PRISMA_lake <- cbind(PRISMA_bands,PRISMA_lake)
PRISMA_lake_long <- PRISMA_lake %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")
PRISMA_lake_long$Wavelength_nm <- as.integer(PRISMA_lake_long$Wavelength_nm)
PRISMA_lake_long$Rrs <- as.numeric(PRISMA_lake_long$Rrs)
PRISMA_lake_long_clean <- PRISMA_lake_long[!is.na(as.numeric(PRISMA_lake_long$Rrs)), ] 

PRISMA_lake_long_clean %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(450,800) +
  #ylim(0,1) +
  labs(title='PRISMA lake-clipped mean spectra')

ggsave("Data/PRISMA/PRISMA_lake_avg_spectra.png")



PRISMA_lake <- read.csv('Data/PRISMA/PRISMA_stats_lake.csv')
PRISMA_lake <- PRISMA_lake[2:8,]  
PRISMA_lake <- PRISMA_lake %>%
  select(c(date, contains("avg"))) %>%
  t() %>%
  row_to_names(row_number = 1)
PRISMA_bands <- read.csv('Data/PRISMA/PRISMA_Bands.csv')
PRISMA_lake <- cbind(PRISMA_bands,PRISMA_lake)
PRISMA_lake_long <- PRISMA_lake %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")
PRISMA_lake_long$Wavelength_nm <- as.integer(PRISMA_lake_long$Wavelength_nm)
PRISMA_lake_long$Rrs <- as.numeric(PRISMA_lake_long$Rrs)
PRISMA_lake_long_clean <- PRISMA_lake_long[!is.na(as.numeric(PRISMA_lake_long$Rrs)), ] 

PRISMA_lake_long_clean %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(450,750) +
  ylim(0,0.025) +
  labs(title='PRISMA lake-clipped mean spectra - 2021-06-05 not shown')

ggsave("Data/PRISMA/PRISMA_lake_avg_spectra_clean.png")

################################################################################

AVIRIS_buoy <- read.csv('Data/AVIRIS/AVIRIS_stats_buoy.csv') %>%
  select(c(date, contains("avg"))) %>%
  t() %>%
  row_to_names(row_number = 1)
AVIRIS_bands <- read.csv('Data/AVIRIS/AVIRIS_Bands.csv')
AVIRIS_buoy <- cbind(AVIRIS_bands,AVIRIS_buoy)
AVIRIS_buoy_long <- AVIRIS_buoy %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")

AVIRIS_buoy_long %>%
  na.omit() %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(400,800) +
  ylim(0,0.03) +
  labs(title='AVIRIS-ng buoy-clipped mean spectra')

ggsave("Data/AVIRIS/AVIRIS_buoy_avg_spectra.png")

################################################################################

AVIRIS_lake <- read.csv('Data/AVIRIS/AVIRIS_stats_lake.csv') %>%
  select(c(date, contains("avg"))) %>%
  select(-X_avg) %>%
  t() %>%
  row_to_names(row_number = 1)
AVIRIS_bands <- read.csv('Data/AVIRIS/AVIRIS_Bands.csv')
AVIRIS_lake <- cbind(AVIRIS_bands,AVIRIS_lake)
AVIRIS_lake_long <- AVIRIS_lake %>%
  pivot_longer(!Wavelength_nm,names_to="date",values_to="Rrs")

AVIRIS_lake_long %>%
  na.omit() %>%
  ggplot(aes(x=Wavelength_nm,y=Rrs)) +
  geom_line() +
  facet_wrap(~date) +
  theme_bw() +
  xlim(400,800) +
  ylim(0,0.03) +
  labs(title='AVIRIS-ng lake-clipped mean spectra')

ggsave("Data/AVIRIS/AVIRIS_lake_avg_spectra.png")


