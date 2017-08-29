require 'spec_helper'
require 'shared_contexts'

describe 'superset' do
  # by default the hiera integration uses hiera data from the shared_contexts.rb file
  # but basically to mock hiera you first need to add a key/value pair
  # to the specific context in the spec/shared_contexts.rb file
  # Note: you can only use a single hiera context per describe/context block
  # rspec-puppet does not allow you to swap out hiera data on a per test block
  #include_context :hiera

  # below is the facts hash that gives you the ability to mock
  # facts on a per describe/context block.  If you use a fact in your
  # manifest you should mock the facts below.
  let(:facts) do
    {}
  end

  # below is a list of the resource parameters that you can override.
  # By default all non-required parameters are commented out,
  # while all required parameters will require you to add a value
  let(:params) do
    {
      #:venv => false,
      #:systempkgs => true,
      #:yumpkg => ["gcc-c++", "libffi-devel", "openssl-devel", "openldap-devel", "python26-devel", "postgresql-devel"],
      #:pippkg => ["cryptography", "sqlalchemy-redshift", "pyhive", "Babel", "superset", "psycopg2"],
      #:cors_options => "",
      #:viz_type_blacklist => "",
      #:druid_data_source_blacklist => "",
      #:additional_module_ds_map => "",
      #:additional_middleware => "",
      #:mapbox_api_key => "",
      #:blueprints => "",
      #:jinja_context_addons => "",
      #:http_headers => "",
      #:version => "system",
      #:pip => "present",
      #:dev => "present",
      #:virtualenv => "present",
      #:gunicorn => "absent",
      #:venv_name => "/var/www/superset",
      #:venv_version => "system",
      #:venv_dir => "/home/deployer/virtualenvs",
      #:owner => "deployer",
      #:group => "deployer",
      #:requirements => "/var/www/superset/requirements.txt",
      #:cwd => "/var/www/superset",
      #:username => "admin",
      #:password => "bi",
      #:firstname => "admin",
      #:lastname => "bi",
      #:email => "bi@letgo.com",
      #:dburi => "postgresql+psycopg2://superset:superset@biprosuperset.chdlenylqwad.us-east-1.rds.amazonaws.com/superset",
      #:ldap => "ldap://10.10.59.70:389",
      #:auth_type => "AUTH_LDAP",
      #:stats_logger => "DummyStatsLogger()",
      #:superset_webserver_address => "0.0.0.0",
      #:custom_security_manager => "None",
      #:secre_key => "\\2\\1thisismyscretkey\\1\\2\\e\\y\\y\\h",
      #:debug => "False",
      #:flask_use_reload => "True",
      #:enable_proxy_fix => "False",
      #:distribute => "False",
      #:email_notifications => "False",
      #:sqlalchemy_track_modifications => "False",
      #:wtf_csrf_enabled => "True",
      #:show_stacktrace => "True",
      #:app_name => "Superset",
      #:app_icon => "/static/assets/images/superset-logo@2x.png",
      #:druid_is_active => "True",
      #:druid_tz => "tz.tzutc()",
      #:druid_analysis_types => "cardinality",
      #:public_role_line_gamma => "False",
      #:upload_folder => "/app/static/uploads/",
      #:img_upload_folder => "/app/static/uploads/",
      #:img_upload_url => "/static/uploads/",
      #:cache_default_timeout => "60 * 60 * 24",
      #:cache_config => "'CACHE_TYPE': 'null'",
      #:table_names_cache_config => "'CACHE_TYPE': 'null'",
      #:enable_cors => "False",
      #:rollover => "midnight",
      #:log_format => "%(asctime)s:%(levelname)s:%(name)s:%(message)s",
      #:log_level => "DEBUG",
      #:enable_time_rotate => "False",
      #:time_rotate_log_devel => "DEBUG",
      #:filename => "os.path.join(DATA_DIR, 'superset.log')",
      #:warning_msg => "None",
      #:enable_celery => "False",
      #:broker_url => "sqla+sqlite:///celerydb.sqlite",
      #:celery_imports => "'superset.sql_lab',",
      #:celery_result_backend => "db+sqlite:///celery_results.sqlite",
      #:celery_annotations => "'tasks.add': {'rate_limit': '10/s'}",
      #:celeryd_log_level => "DEBUG",
      #:celery_acks_late => "True",
      #:celery_config => "None",
      #:sql_celery_db_file_path => "os.path.join(DATA_DIR, 'celerydb.sqlite')",
      #:sql_celery_results_db_file_path => "os.path.join(DATA_DIR, 'celery_results.sqlite')",
      #:default_db_id => "None",
      #:sqllab_default_dbid => "None",
      #:sqllab_async_time_limit_sec => "60 * 60 * 6",
      #:results_backend => "None",
      #:robot_permissons_roles => "'Public', 'Gamma', 'Alpha', 'Admin', 'sql_lab'",
      #:config_path_env_var => "SUPERSET_CONFIG_PATH",
      #:smtp_host => "localhost",
      #:smtp_starttls => "True",
      #:smtp_ssl => "False",
      #:smtp_user => "superset",
      #:smtp_password => "superset",
      #:smtp_mail_from => "superset@superset.com",
      #:silence_fab => "True",
      #:timeout => "0",
      #:row_limit => "50000",
      #:viz_row_limit => "10000",
      #:superset_workers => "2",
      #:superset_celery_workers => "32",
      #:superset_webserver_port => "8088",
      #:superset_webserver_timeout => "60",
      #:query_search_limit => "1000",
      #:sql_max_row => "1000000",
      #:displa_sql_max_row => "1000",
      #:max_table_names => "3000",
      #:celeryd_prefetch_multiplier => "1",
      #:inteval => "1",
      #:backup_count => "30",
      #:sqllab_timeout => "30",
      #:smtp_port => "25",

    }
  end
  # add these two lines in a single test block to enable puppet and hiera debug mode
  # Puppet::Util::Log.level = :debug
  # Puppet::Util::Log.newdestination(:console)
  
  it do
    is_expected.to contain_class("python")
        .with({
          "version" => "system",
          "pip" => "present",
          "dev" => "present",
          "virtualenv" => "present",
          "gunicorn" => "absent",
          "that_comes_before" => 'Package[gcc-c++ libffi-devel openssl-devel openldap-devel python26-devel postgresql-devel]', })
  end
    
  it do
    is_expected.to contain_package(["gcc-c++", "libffi-devel", "openssl-devel", "openldap-devel", "python26-devel", "postgresql-devel"])
        .with({
          "ensure" => "installed",
          "that_requires" => 'Class[python]', })
  end
    
  it do
    is_expected.to contain_package(["cryptography", "sqlalchemy-redshift", "pyhive", "Babel", "superset", "psycopg2"])
        .with({
          "ensure" => "installed",
          "provider" => "pip",
          })
  end
    
  it do
    is_expected.to contain_python__virtualenv("/var/www/superset")
        .with({
          "ensure" => "present",
          "version" => "system",
          "requirements" => "/var/www/superset/requirements.txt",
          "systempkgs" => true,
          "distribute" => "False",
          "venv_dir" => "/home/deployer/virtualenvs",
          "owner" => "deployer",
          "group" => "deployer",
          "cwd" => "/var/www/superset",
          "timeout" => "0",
          })
  end
    
  it do
    is_expected.to contain_exec("create_admin_supersert")
        .with({
          "command" => "fabmanager create-admin --app superset --username admin --password bi --firstname admin --lastname bi --email bi@letgo.com",
          "refreshonly" => true,
          "path" => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
          "subscribe" => "Package[[cryptography, sqlalchemy-redshift, pyhive, Babel, superset, psycopg2]]",
          "that_comes_before" => 'File[/usr/local/lib/python2.7/site-packages/superset/config.py]', })
  end
    
  it do
    is_expected.to contain_file("/usr/local/lib/python2.7/site-packages/superset/config.py")
        .with({
          "ensure" => "file",
          "mode" => "0644",
          "content" => [],
          "that_requires" => 'Exec[create_admin_supersert]', })
  end
    
  it do
    is_expected.to contain_exec("initialize_database")
        .with({
          "command" => "superset db upgrade",
          "refreshonly" => true,
          "path" => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
          "subscribe" => "Exec[create_admin_supersert]",
          })
  end
    
  it do
    is_expected.to contain_exec("create_roles")
        .with({
          "command" => "superset init",
          "refreshonly" => true,
          "path" => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
          "subscribe" => "Exec[initialize_database]",
          })
  end
    
  it do
    is_expected.to contain_exec("start_web_server")
        .with({
          "command" => "superset runserver",
          "refreshonly" => true,
          "path" => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
          "subscribe" => "Exec[create_roles]",
          })
  end
    
end
