# dbt-sample-application
Small application to learn the basics of dbt.

## Prerequisites

- Python
- Docker and docker compose

## Run *dbt*

By default `dbt` will look for warehouse connections in the file `~/.dbt/profiles.yml`. The `DBT_PROFILES_DIR` environment variable tells dbt to look for the `profiles.yml` file in the current working directory:

```shell
export DBT_PROFILES_DIR=$(pwd)
cd dbt
dbt run
```


