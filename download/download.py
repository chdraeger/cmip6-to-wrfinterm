import pandas as pd
import numpy as np
import zarr
import xarray as xr
import gcsfs
import matplotlib.pyplot as plt
import matplotlib
# matplotlib.use('TkAgg') # interactive

# variable list:
# https://psl.noaa.gov/repository/entry/show?entryid=0621e6b0-de3a-4ecc-9e9a-42c3305c671b

df = pd.read_csv('https://storage.googleapis.com/cmip6/cmip6-zarr-consolidated-stores.csv')
gcs = gcsfs.GCSFileSystem(token='anon')



#=======================================================================================================================
# Get CMIP6 data
#=======================================================================================================================
def get_cmip6(var, table_id, dim, source_id, experiment_id, start_day, end_day):

    query_str = ("activity_id=='ScenarioMIP' & table_id == '" + table_id + "' & variable_id == '" + var
                 + "' & experiment_id == '" + experiment_id + "' & source_id == '" + source_id + "'")
    df_var = df.query(query_str)

    zstore = df_var.zstore.values[-1]  # take the most recent store (table is sorted by version)
    mapper = gcs.get_mapper(zstore)
    ds = xr.open_zarr(mapper) # consolidated = True?
    ds_loc = ds.sel(lat=slice(40,49), lon=slice(100,123)) # location

    if dim == '3d':
        ds_loc = ds_loc.sel(plev = 8.5e+04)

    ds_t = getattr(ds_loc, var).sel(time=slice(start_day, end_day)) # time

    # plot
    ds_t.squeeze().plot()
    plt.savefig('download/test.png')
    plt.clf()

    # save

    ds_t.to_netcdf(f'download/{var}_{source_id}_{experiment_id}_{ds.parent_variant_label}_{ds.grid_label}_'
                   f'{start_day}_{end_day}.nc')

if __name__ == "__main__":

    source_id = 'MPI-ESM1-2-LR'
    experiment_id = 'ssp585'
    start_day = '2020-01-01'
    end_day = '2021-01-01'

    my_full_objects = [['tas', '2d', '3hr'], # surface temperature; day
                       ['huss', '2d', '6hrPlev'], #
                       ['tos', '2d', '6hrPlev'], # SST; Oday
                       ['ta', '3d', '6hrLev'], # temperature; day
                       ['ta', '3d', '6hrPlev'],
                       ]

    for my_var, my_dim, my_table_id in my_full_objects:

        print(f"Start: {my_var}, dim: {my_dim},  {my_table_id}")

        get_cmip6(my_var, my_table_id, my_dim, source_id, experiment_id, start_day, end_day)

        print(f"Done: {my_var}.")