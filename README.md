# dbt-sample-application
Small application to learn the basics of dbt. 

References:
- [dbt official courses](https://courses.getdbt.com/collections/courses)
- [Start Data Engineering: dbt tutorial](https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/)
- [GitHub: jaffle_shop data - dbt project](https://github.com/dbt-labs/jaffle_shop/blob/main/dbt_project.yml)

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


