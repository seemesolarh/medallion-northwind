# Import necessary libraries
import requests  # to connect to API
import pandas as pd  # for data transformation
import configparser  # to create my configurations
from sqlalchemy import create_engine  # this helps me communicate with PostgreSQL
import json

# Create configuration interface
def etl_process():
    config = configparser.ConfigParser()
    config.read('config.ini')
   

    postgres_config = config['postgres']
    engine = create_engine(
        f"postgresql://{postgres_config['user']}:{postgres_config['password']}@{postgres_config['host']}:{postgres_config['port']}/{postgres_config['database']}")
    # Create API requests
    endpoint = 'https://demodata.grapecity.com/northwind/api/v1/Orders'
    response = requests.get(endpoint)
    data = response.json()
      
    # load data into progres
    df = pd.json_normalize(data)
    df.to_sql('orders_raw', engine, if_exists= 'replace', index=False)
    engine.dispose()
etl_process()