import pandas as pd
import numpy as np
import zarr
import xarray as xr
import gcsfs
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('TkAgg') # interactive

# variable list:
# https://psl.noaa.gov/repository/entry/show?entryid=0621e6b0-de3a-4ecc-9e9a-42c3305c671b

#=======================================================================================================================
# Get CMIP6 data
#=======================================================================================================================
def get_cmip6(var, table_id, dim, source_id, experiment_id, member_id, start_day, end_day):

    query_str = ("activity_id=='ScenarioMIP' & table_id == '" + table_id + "' & variable_id == '" + var
                 + "' & experiment_id == '" + experiment_id + "' & member_id == '" + member_id
                 + "' & source_id == '" + source_id + "'")
    df_var = df.query(query_str)

    zstore = df_var.zstore.values[-1]  # take the most recent store (table is sorted by version)
    mapper = gcs.get_mapper(zstore)
    ds = xr.open_zarr(mapper) # consolidated = True?
    ds_loc = ds.sel(lat=slice(31,80), lon=slice(175,300)) # location

    ds_t = getattr(ds_loc, var).sel(time=slice(start_day, end_day)) # time

    # save
    # ds.parent_variant_label = member_id
    ds_t.to_netcdf(f'download/{var}_{table_id}_{source_id}_{experiment_id}_{member_id}_{ds.grid_label}_{start_day}_{end_day}.nc')

    # plot
    if dim == '2d':
        # ds_t = ds_t.sel(lev=0.9826)
        # ds_t.sel(time='2020-01-01').squeeze().plot()
        # a = ds_t.sel(time='2020-01-01', method='nearest')
        # a = a.sel(lev='0.9961', method='nearest')

        # ds_t.squeeze().plot()
        ds_t.sel(time='2020-01-01', method='nearest').plot()
        plt.savefig(f'download/{var}.png')
        plt.clf()


def crop_cmip6(var, table_id, dim, source_id, experiment_id, member_id, start_day, end_day):
    file = 'download/tos_3hr_MPI-ESM1-2-HR_ssp585_r1i1p1f1_gn_201501010300-202001010000.nc'


if __name__ == "__main__":

    df = pd.read_csv('https://storage.googleapis.com/cmip6/cmip6-zarr-consolidated-stores.csv')
    gcs = gcsfs.GCSFileSystem(token='anon')

    source_id = 'MPI-ESM1-2-HR' # high resolution (100km)
    experiment_id = 'ssp585'
    member_id = 'r1i1p1f1'
    start_day = '2015-01-01T0600'
    end_day = '2020-01-01T0000'

    my_full_objects = [['hus', '3d', '6hrLev'], # relative humidity
             ##          ['huss', '2d', '3hr'], # 2m relative humidity
            ##           ['mrsos', '2d', 'day'],  # 0-10 cm soil moisture
                       ['ps', '2d', '6hrLev'],  # surface pressure
             ##          ['psl', '2d', 'day'],  # mean sea-level pressure
                       ['ta', '3d', '6hrLev'], # temperature
              ##         ['tas', '2d', '3h'],  # surface temperature
              ## 3hr         ['tos', '2d', 'Oday'],  # SST
              ##         ['ts', '2d', 'Amon'],  # skin temperature
                       # tsl missing 10-200 cm soil temp
                       ['ua', '3d', '6hrLev'],  #  wind u-component
              ##         ['uas', '2d', '3hr'],  # 10m wind u-component
                       ['va', '3d', '6hrLev']]  # wind v-component
              ##         ['vas', '2d', '3hr'],  # 10m wind v-component
              ##         ['zg', '3d', 'day']]  # geopotential height


    for my_var, my_dim, my_table_id in my_full_objects:

        print(f"Start: {my_var}, dim: {my_dim},  {my_table_id}")

        get_cmip6(my_var, my_table_id, my_dim, source_id, experiment_id, member_id, start_day, end_day)

        print(f"Done: {my_var}.")