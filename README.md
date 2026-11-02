# Airbnb Analytics with dbt and Snowflake

A dbt project that transforms Airbnb listings, hosts, and bookings into analytics-ready Snowflake models.

## Data flow

```text
AIRBNB.STAGING
      |
      v
   Bronze  ->  Silver  ->  Gold
                            ├── Fact model
                            ├── One-big-table model
                            └── Booking, host, and listing snapshots
```

- **Bronze**: materializes the source listings, hosts, and bookings.
- **Silver**: prepares the core entities for downstream analysis.
- **Gold**: builds joined analytics models, including a fact model and an
  one-big-table model.
- **Snapshots**: tracks changes to booking, host, and listing records over time.

## Project layout

```text
models/
  bronze/       Source-level models
  silver/       Prepared entity models
  gold/         Analytics models
  sources/      Snowflake source declarations
macros/         Reusable SQL and schema naming logic
snapshots/      Historical change tracking
tests/          Custom data quality tests
```

## Run the project

Requirements: Python, dbt Core, and the Snowflake adapter. Create a virtual
environment before installing dependencies if you prefer to isolate them.

1. Install `dbt-core` and `dbt-snowflake` in your environment.
2. Configure the `aws_dbt_snowflake_project` profile in
   `~/.dbt/profiles.yml` with your Snowflake account and credentials. The
   project reads source tables from the `AIRBNB.STAGING` schema.
3. From the repository root, validate the connection and build the project:

   ```sh
   dbt debug
   dbt build
   ```

Never commit `profiles.yml`, credentials, or environment-specific secrets.
Generated dbt artifacts, logs, and local profiles are excluded from Git.
