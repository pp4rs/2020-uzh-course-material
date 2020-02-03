def download_data(weblink, data_dir, zip_name, table_number):
    """
    This function downloads data from Daron Acemoglu's website for the AJR01 paper.

    In particular:
        1. Downloads a ZIP archive of the files needed to generate one table
        2. Unzips these files
        3. Imports the data set as a Pandas DataFrame

    Example Usage:

    """
    import shutil
    import requests
    import zipfile
    import glob
    import os
    import pandas as pd

    # check a data directory exists, or create it
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)

    # connect to the page
    response = requests.get(weblink, stream=True, verify=False)

    # save the zip to our preferred location
    with open(data_dir + zip_name, 'wb') as out_file:
        shutil.copyfileobj(response.raw, out_file)

    # clean up
    del response

    # unzip
    zip_ref = zipfile.ZipFile(data_dir + zip_name, 'r')
    zip_ref.extractall(data_dir)

    # find the data file
    data_file = glob.glob(data_dir + '*' + table_number + '.dta')[0]

    return pd.read_stata(data_file)
