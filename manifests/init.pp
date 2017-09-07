class superset (

  Boolean          $venv                            = false,
  Boolean          $systempkgs                      = true,
  Array            $additional_pkg                  = ['gcc-c++','libffi-devel','openssl-devel','openldap-devel','python26-devel','postgresql-devel'],
  Array            $pippkg                          = ['cryptography','sqlalchemy-redshift','pyhive','Babel','superset','psycopg2'],
  Optional[String] $cors_options                    = '',
  Optional[String] $viz_type_blacklist              = '',
  Optional[String] $druid_data_source_blacklist     = '',
  Optional[String] $additional_module_ds_map        = '',
  Optional[String] $additional_middleware           = '',
  Optional[String] $mapbox_api_key                  = '',
  Optional[String] $blueprints                      = '',
  Optional[String] $jinja_context_addons            = '',
  Optional[String] $http_headers                    = '',
  String           $config_py                       = '/usr/local/lib/python2.7/site-packages/superset/config.py',
  String           $version                         = 'system',
  String           $pip                             = 'present',
  String           $dev                             = 'present',
  String           $virtualenv                      = 'present',
  String           $gunicorn                        = 'absent',
  String           $venv_name                       = '/var/www/superset',
  String           $venv_version                    = 'system',
  String           $venv_dir                        = '/home/root/virtualenvs',
  String           $owner                           = 'root',
  String           $group                           = 'root',
  String           $requirements                    = '/var/www/superset/requirements.txt',
  String           $cwd                             = '/var/www/superset',
  String           $username                        = 'admin',
  String           $password                        = 'admin',
  String           $firstname                       = 'superset',
  String           $lastname                        = 'superset',
  String           $email                           = 'foo@foo.com',
  String           $dburi                           = 'sqlite:////home/data/superset.db',
  String           $ldap                            = 'ldap://10.0.0.0:111',
  String           $auth_type                       = 'AUTH_LDAP',
  String           $stats_logger                    = 'DummyStatsLogger()',
  String           $superset_webserver_address      = '0.0.0.0',
  String           $custom_security_manager         = 'None',
  String           $secre_key                       = '\2\1thisismyscretkey\1\2\e\y\y\h',
  String           $debug                           = 'False',
  String           $flask_use_reload                = 'True',
  String           $enable_proxy_fix                = 'False',
  String           $distribute                      = 'False',
  String           $email_notifications             = 'False',
  String           $sqlalchemy_track_modifications  = 'False',
  String           $wtf_csrf_enabled                = 'True',
  String           $show_stacktrace                 = 'True',
  String           $app_name                        = 'Superset',
  String           $app_icon                        = '/static/assets/images/superset-logo@2x.png',
  String           $druid_is_active                 = 'True',
  String           $druid_tz                        = 'tz.tzutc()',
  String           $druid_analysis_types            = 'cardinality',
  String           $public_role_line_gamma          = 'False',
  String           $upload_folder                   = '/app/static/uploads/',
  String           $img_upload_folder               = '/app/static/uploads/' ,
  String           $img_upload_url                  = '/static/uploads/',
  String           $cache_default_timeout           = '60 * 60 * 24',
  String           $cache_config                    = "'CACHE_TYPE': 'null'",
  String           $table_names_cache_config        = "'CACHE_TYPE': 'null'",
  String           $enable_cors                     = 'False',
  String           $rollover                        = 'midnight',
  String           $log_format                      = '%(asctime)s:%(levelname)s:%(name)s:%(message)s',
  String           $log_level                       = 'DEBUG',
  String           $enable_time_rotate              = 'False',
  String           $time_rotate_log_devel           = 'DEBUG',
  String           $filename                        = "os.path.join(DATA_DIR, 'superset.log')",
  String           $warning_msg                     = 'None',
  String           $enable_celery                   = 'False',
  String           $broker_url                      = 'sqla+sqlite:///celerydb.sqlite',
  String           $celery_imports                  = "'superset.sql_lab',",
  String           $celery_result_backend           = 'db+sqlite:///celery_results.sqlite',
  String           $celery_annotations              = "'tasks.add': {'rate_limit': '10/s'}",
  String           $celeryd_log_level               = 'DEBUG',
  String           $celery_acks_late                = 'True',
  String           $celery_config                   = 'None',
  String           $sql_celery_db_file_path         = "os.path.join(DATA_DIR, 'celerydb.sqlite')",
  String           $sql_celery_results_db_file_path = "os.path.join(DATA_DIR, 'celery_results.sqlite')",
  String           $default_db_id                   = 'None',
  String           $sqllab_default_dbid             = 'None',
  String           $sqllab_async_time_limit_sec     = '60 * 60 * 6',
  String           $results_backend                 = 'None',
  String           $robot_permissons_roles          = "'Public', 'Gamma', 'Alpha', 'Admin', 'sql_lab'",
  String           $config_path_env_var             = 'SUPERSET_CONFIG_PATH',
  String           $smtp_host                       = 'localhost',
  String           $smtp_starttls                   = 'True',
  String           $smtp_ssl                        = 'False',
  String           $smtp_user                       = 'superset',
  String           $smtp_password                   = 'superset',
  String           $smtp_mail_from                  = 'superset@superset.com',
  String           $silence_fab                     = 'True',
  Integer          $timeout                         = 0,
  Integer          $row_limit                       = 50000,
  Integer          $viz_row_limit                   = 10000,
  Integer          $superset_workers                = 2,
  Integer          $superset_celery_workers         = 32,
  Integer          $superset_webserver_port         = 8088,
  Integer          $superset_webserver_timeout      = 60,
  Integer          $query_search_limit              = 1000,
  Integer          $sql_max_row                     = 1000000,
  Integer          $displa_sql_max_row              = 1000,
  Integer          $max_table_names                 = 3000,
  Integer          $celeryd_prefetch_multiplier     = 1,
  Integer          $inteval                         = 1,
  Integer          $backup_count                    = 30,
  Integer          $sqllab_timeout                  = 30,
  Integer          $smtp_port                       = 25,

){

  class { 'python' :
    version    => $version,
    pip        => $pip,
    dev        => $dev,
    virtualenv => $virtualenv,
    gunicorn   => $gunicorn ,
  } ->

  package { $additional_pkg:
    ensure => installed,
  } ->

  package { $pippkg:
    ensure   => installed,
    provider => pip,
  }

  if $venv == true { #Python 3 already ships virtualenv
    python::virtualenv { $venv_name :
      ensure       => present,
      version      => $venv_version,
      requirements => $requirements,
      systempkgs   => $systempkgs,
      distribute   => $distribute,
      venv_dir     => $venv_dir,
      owner        => $owner,
      group        => $group,
      cwd          => $cwd,
      timeout      => $timeout,
    }
  }

  exec { 'create_admin_supersert':
    command     => "fabmanager create-admin --app superset --username ${username} --password ${password} --firstname ${firstname} --lastname ${lastname} --email ${email}",
    refreshonly => true,
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    subscribe   => Package[$pippkg]
  } ->

  file { $config_py:
    ensure  => file,
    mode    => '0644',
    content => template("${module_name}/config.py.erb"),
  } ->

  exec { 'initialize_database':
    command     => 'superset db upgrade',
    refreshonly => true,
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    subscribe   => Exec['create_admin_supersert'],
  } ->

  exec { 'create_roles':
    command     => 'superset init',
    refreshonly => true,
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    subscribe   => Exec['initialize_database'],
  } ->

  exec { 'start_web_server':
    command     => 'superset runserver',
    refreshonly => true,
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    subscribe   => Exec['create_roles'],
  }
}
