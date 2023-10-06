# dbt-sample-application
Small application to learn the basics of dbt. 

References:
- [dbt official courses](https://courses.getdbt.com/collections/courses)
- [Start Data Engineering: dbt tutorial](https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/)
- [GitHub: jaffle_shop data - dbt project](https://github.com/dbt-labs/jaffle_shop/blob/main/dbt_project.yml)

## Prerequisites

- Python
- Docker and docker compose

## Run *dbt* on local

By default `dbt` will look for warehouse connections in the file `~/.dbt/profiles.yml`. The `DBT_PROFILES_DIR` environment variable tells dbt to look for the `profiles.yml` file in the current working directory. You need to define all the connections credentials in you local `.env`:

```shell
# Set to recognize profiles.yml
DBT_PROFILES_DIR=$(pwd)
# DEV database parameters
DBT_POSTGRES_HOST_DEV=localhost
DBT_POSTGRES_PORT_DEV=5432
DBT_POSTGRES_USER_DEV=dbt_dev
DBT_POSTGRES_PWD_DEV=password
DBT_POSTGRES_DBNAME_DEV=jaffle_shop_dev
DBT_POSTGRES_SCHEMA_DEV=dbt_dev
```

```shell
set -a; source .env; set +a
cd dbt
dbt run/build/test/...
```

## CI/CD pipelines
The repo is configured to run 2 separate GitHub Actions workflows:
- On any *push* to *"main"* branch, deploy to `dbt_final` schema in the remote Postgres db
- On any *Pull Request*, deploy to `dbt_pr{pull_request_number}_{short_commit_sha}` schema

For these pipelines to work, you need to define these roles beforehand on the Postgres db:

```sql
-- Role for dbt to deploy in PROD
CREATE ROLE dbt_prod WITH LOGIN PASSWORD 'password_prod';
GRANT ALL PRIVILEGES ON SCHEMA raw TO dbt_prod;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA "raw" TO dbt_prod;

-- Role for dbt to deploy in STAG
CREATE ROLE dbt_stag WITH CREATEDB LOGIN PASSWORD 'password_stag';
GRANT CREATE ON DATABASE jaffle_shop_prod TO dbt_stag;
GRANT USAGE ON SCHEMA raw TO dbt_stag;
GRANT SELECT ON ALL TABLES IN SCHEMA raw TO dbt_stag;
```

## Future work
- The STAG schemas related to the Pull Requests should be cleanup automatically after a given time to avoid bloating the db instance



