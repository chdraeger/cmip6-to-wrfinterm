#!/bin/sh
# ----- 3D fields

STRTDATE=205001010600
ENDDATE=205501010000

# 126 370
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/hus/gn/v20190710/hus_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_205001010600-205501010000.nc

# Specific Humidity
# hus
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/hus/gn/v20190710/hus_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# Air Temp
# ta
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/ta/gn/v20190710/ta_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# Uwind
# ua
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/ua/gn/v20190710/ua_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# Vwind
# va
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/va/gn/v20190710/va_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# Geopotential height
# zg
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/zg/gn/v20190710/zg_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc



# ----- 2D fields
# Surface Temperature
# ts
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/ts/gn/v20190710/ts_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
# Surface Pressure
# ps
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrLev/ps/gn/v20190710/ps_6hrLev_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
# Sea level pressure
# psl
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/psl/gn/v20190710/psl_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
# 2-m Temp
# tas
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/tas/gn/v20190710/tas_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
# 2-m Sepcific Humidity
# huss
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/huss/gn/v20190710/huss_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
# 10-m Uwind
# uas
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/uas/gn/v20190710/uas_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
# 10-m Vwind
# vas
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/vas/gn/v20190710/vas_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc

# ----- Land Surface data
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/mrsol/gn/v20190710/mrsol_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/mrsos/gn/v20190710/mrsos_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
wget http://esgf3.dkrz.de/thredds/fileServer/cmip6/ScenarioMIP/DKRZ/MPI-ESM1-2-HR/ssp585/r1i1p1f1/6hrPlevPt/tsl/gn/v20190710/tsl_6hrPlevPt_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_${STRTDATE}-${ENDDATE}.nc
