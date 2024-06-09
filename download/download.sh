#!/bin/sh
# NEW UPDATED

STRTDATE=209501010600
STRTDATE_SST=209501010300
ENDDATE=210001010000


# ----- 3D fields
# hus
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/hus/gn/v20190710/hus_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# ta air temperature
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/ta/gn/v20190710/ta_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# ua Uwind
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/ua/gn/v20190710/ua_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# va Vwind
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/va/gn/v20190710/va_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# zg geopotential height
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/zg/gn/v20190710/zg_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# ----- 2D fields
# huss 2m specific humidity
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/huss/gn/v20190710/huss_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# ts skin temperature
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/ts/gn/v20190710/ts_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# tas temperature
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/tas/gn/v20190710/tas_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# uas 10-m Uwind
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/uas/gn/v20190710/uas_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# vas 10-m Vwind
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/vas/gn/v20190710/vas_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# psl sea-level pressure
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/psl/gn/v20190710/psl_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# ps surface pressure
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrLev/ps/gn/v20190710/ps_6hrLev_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc


#------- # tos: SST (3hr)
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/3hr/tos/gn/v20190710/tos_3hr_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE_SST}-${ENDDATE}.nc
# remap sst to latlong
cdo remapnn,grid.txt tos_3hr_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE_SST}-${ENDDATE}.nc tos_3hr_latlong.nc
# merge from 3hr to 6hr averages
ncra --mro -d time,,,2,2 tos_3hr_latlong.nc  tos_6hr_latlong_degC.nc
# change unit from degC to K
cdo addc,+273.15 -setattribute,tos@units=K tos_6hr_latlong_degC.nc tos_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc


# ----- Land Surface data
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/mrsol/gn/v20190710/mrsol_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/mrsos/gn/v20190710/mrsos_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/tsl/gn/v20190710/tsl_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc


# previously cropping, but does not work with current (Github-downloaded) python code
# ncks -d lat,31,80 -d lon,175,300 hus_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc -O cropped/hus_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
# takes 4 min for 3d