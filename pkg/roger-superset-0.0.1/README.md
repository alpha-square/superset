# superset

## Usage:

``` puppet

include superset

```

## Hiera:

The variables additional_pkg and pippkg are used to install additional packages that we may need

``` puppet

superset::venv: false
superset::systempkgs: true
superset::additional_pkg:
  - 'gcc-c++'
  - 'libffi-devel'
  - 'openssl-devel'
  - 'openldap-devel'
  - 'python26-devel'
  - 'postgresql-devel'
superset::pippkg:
  - 'cryptography'
  - 'sqlalchemy-redshift'
  - 'pyhive'
  - 'Babel'
  - 'superset'
  - 'psycopg2'
superset::cors_options: ''
superset::viz_type_blacklist: ''
superset::druid_data_source_blacklist: ''
superset::additional_module_ds_map: ''
superset::additional_middleware: ''
superset::mapbox_api_key: ''
superset::blueprints: ''
superset::jinja_context_addons: ''
superset::http_headers: ''
superset::config_py: '/usr/local/lib/python2.7/site-packages/superset/config.py'
superset::version: 'system'
superset::pip: 'present'
superset::dev: 'present'
superset::virtualenv: 'present'
superset::gunicorn: 'absent'
superset::venv_name: '/var/www/superset'
superset::venv_version: 'system'
superset::venv_dir: '/home/root/virtualenvs'
superset::owner: 'root'
superset::group: 'root'
superset::requirements: '/var/www/superset/requirements.txt'
superset::cwd: '/var/www/superset'
superset::username: 'admin'
superset::password: 'admin'
superset::firstname: 'superset'
superset::lastname: 'superset'
superset::email: 'foo@foo.com'
superset::dburi: 'sqlite:////home/data/superset.db'
superset::ldap: 'ldap://10.0.0.0:111'
superset::auth_type: 'AUTH_LDAP'
superset::stats_logger: 'DummyStatsLogger()'
superset::superset_webserver_address: '0.0.0.0'
superset::custom_security_manager: 'None'
superset::secre_key: '\2\1thisismyscretkey\1\2\e\y\y\h'
superset::debug: 'False'
superset::flask_use_reload: 'True'
superset::enable_proxy_fix: 'False'
superset::distribute: 'False'
superset::email_notifications: 'False'
superset::sqlalchemy_track_modifications: 'False'
superset::wtf_csrf_enabled: 'True'
superset::show_stacktrace: 'True'
superset::app_name: 'Superset'
superset::app_icon: '/static/assets/images/superset-logo@2x.png'
superset::druid_is_active: 'True'
superset::druid_tz: 'tz.tzutc()'
superset::druid_analysis_types: 'cardinality'
superset::public_role_line_gamma: 'False'
superset::upload_folder: '/app/static/uploads/'
superset::img_upload_folder: '/app/static/uploads/'
superset::img_upload_url: '/static/uploads/'
superset::cache_default_timeout: '60 * 60 * 24'
superset::cache_config: "'CACHE_TYPE': 'null'"
superset::table_names_cache_config: "'CACHE_TYPE': 'null'"
superset::enable_cors: 'False'
superset::rollover: 'midnight'
superset::log_format: '%(asctime)s:%(levelname)s:%(name)s:%(message)s'
superset::log_level: 'DEBUG'
superset::enable_time_rotate: 'False'
superset::time_rotate_log_devel: 'DEBUG'
superset::filename: "os.path.join(DATA_DIR 'superset.log')"
superset::warning_msg: 'None'
superset::enable_celery: 'False'
superset::broker_url: 'sqla+sqlite:///celerydb.sqlite'
superset::celery_imports: "'superset.sql_lab'"
superset::celery_result_backend: 'db+sqlite:///celery_results.sqlite'
superset::celery_annotations: "'tasks.add': {'rate_limit': '10/s'}"
superset::celeryd_log_level: 'DEBUG'
superset::celery_acks_late: 'True'
superset::celery_config: 'None'
superset::sql_celery_db_file_path: "os.path.join(DATA_DIR 'celerydb.sqlite')"
superset::sql_celery_results_db_file_path: "os.path.join(DATA_DIR 'celery_results.sqlite')"
superset::default_db_id: 'None'
superset::sqllab_default_dbid: 'None'
superset::sqllab_async_time_limit_sec: '60 * 60 * 6'
superset::results_backend: 'None'
superset::robot_permissons_roles: "'Public' 'Gamma' 'Alpha' 'Admin' 'sql_lab'"
superset::config_path_env_var: 'SUPERSET_CONFIG_PATH'
superset::smtp_host: 'localhost'
superset::smtp_starttls: 'True'
superset::smtp_ssl: 'False'
superset::smtp_user: 'superset'
superset::smtp_password: 'superset'
superset::smtp_mail_from: 'superset@superset.com'
superset::silence_fab: 'True'
superset::timeout: 0
superset::row_limit: 50000
superset::viz_row_limit: 10000
superset::superset_workers: 2
superset::superset_celery_workers: 32
superset::superset_webserver_port: 8088
superset::superset_webserver_timeout: 60
superset::query_search_limit: 1000
superset::sql_max_row: 1000000
superset::displa_sql_max_row: 1000
superset::max_table_names: 3000
superset::celeryd_prefetch_multiplier: 1
superset::inteval: 1
superset::backup_count: 30
superset::sqllab_timeout: 30
superset::smtp_port: 25

```
