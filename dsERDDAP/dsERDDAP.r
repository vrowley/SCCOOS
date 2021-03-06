library(stringr)

stations <- c("scripps_pier", "newport_pier", "stearns_wharf", "santa_monica_pier")

for (station in stations){
#  get_all_years_url = str_c('http://sccoos.org/erddap/tabledap/autoss.csv?station,time,temperature,temperature_flagPrimary,temperature_flagSecondary,conductivity,conductivity_flagPrimary,conductivity_flagSecondary,pressure,pressure_flagPrimary,pressure_flagSecondary,chlorophyll,chlorophyll_flagPrimary,chlorophyll_flagSecondary,salinity,salinity_flagPrimary,salinity_flagSecondary,sigmat,diagnosticVoltage,currentDraw,aux1,aux3,aux4,latitude,longitude,depth,O2thermistor,convertedOxygen&station="',station,'"&time>=2005-06-16T19%3A27%3A53Z&time<2018-09-17T17%3A30%3A45Z')
  get_all_years_url = str_c('http://sccoos.org/erddap/tabledap/autoss.csv?station,time,temperature,temperature_flagPrimary,temperature_flagSecondary,latitude,longitude,depth&station="',station,'"&time>=2005-06-16T19%3A27%3A53Z&time<2018-09-17T17%3A30%3A45Z')
  file.remove("temp.csv")
  file.create("temp.csv")
  all_dest_file = str_c('autoss_',station,'_all.csv', sep='')
  file.create(all_dest_file)
  curl::curl_download(get_all_years_url, "temp.csv")
#  write.csv(1:1000, file=temp_dest_file)
  file.pipe <- pipe("awk 'BEGIN{i=14}{i++;if (i%15==0) print $1}' < temp.csv ")
  res <- read.csv(file.pipe)
  write.csv(res, file = all_dest_file)
}

# years = seq(2005, 2017)
# for (station in stations){
#   for (year in years){
#     erddap_url = str_c('http://sccoos.org/erddap/tabledap/autoss.csv?station,time,temperature,temperature_flagPrimary,temperature_flagSecondary,conductivity,conductivity_flagPrimary,conductivity_flagSecondary,pressure,pressure_flagPrimary,pressure_flagSecondary,chlorophyll,chlorophyll_flagPrimary,chlorophyll_flagSecondary,salinity,salinity_flagPrimary,salinity_flagSecondary,sigmat,diagnosticVoltage,currentDraw,aux1,aux3,aux4,latitude,longitude,depth,O2thermistor,convertedOxygen&station="',station,'"&time>=',year,'-01-01T00%3A00%3A00Z&time<',year,'-12-31T11%3A59%3A59Z&orderBy("time")')
#     dest_file = str_c('autoss_',station,'_', year,'.csv', sep='')
#     download.file(url = erddap_url, destfile = dest_file)
#   }
# }
# sass_good <- sass_data %>% filter(temperature_flagPrimary==1, temperature_flagSecondary == 0, conductivity_flagPrimary==1, conductivity_flagSecondary==0, pressure_flagPrimary==1, pressure_flagSecondary==0, chlorophyll_flagPrimary==1, chlorophyll_flagSecondary==0, salinity_flagPrimary==1, salinity_flagSecondary==0)
# sass_needed <- sass_good %>% select(temperature, conductivity, pressure, chlorophyll, salinity)
# sass_datetime <- sass_good %>% select(time)
# sass_date <- strptime(sass_datetime,format = "%Y-%m-%dT%H:%M:%SZ",tz = "GMT")
# 
# for (my_datetime in sass_datetime){
#   sass_date <- strptime(my_datetime,format = "%Y-%m-%dT%H:%M:%SZ")
#   print(sass_date)
# }
