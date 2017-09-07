# optional, this should be the path to where the hiera data config file is in this repo
# You must update this if your actual hiera data lives inside your module.
# I only assume you have a separate repository for hieradata and its include in your .fixtures
hiera_config_file = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures','modules','hieradata', 'hiera.yaml'))

# hiera_config and hiera_data are mutually exclusive contexts.

shared_context :global_hiera_data do
  let(:hiera_data) do
     {
       #"superset::additional_middleware" => '',
       #"superset::additional_module_ds_map" => '',
       #"superset::app_icon" => '',
       #"superset::app_name" => '',
       #"superset::auth_type" => '',
       #"superset::backup_count" => '',
       #"superset::blueprints" => '',
       #"superset::broker_url" => '',
       #"superset::cache_config" => '',
       #"superset::cache_default_timeout" => '',
       #"superset::celery_acks_late" => '',
       #"superset::celery_annotations" => '',
       #"superset::celery_config" => '',
       #"superset::celery_imports" => '',
       #"superset::celery_result_backend" => '',
       #"superset::celeryd_log_level" => '',
       #"superset::celeryd_prefetch_multiplier" => '',
       #"superset::config_path_env_var" => '',
       #"superset::cors_options" => '',
       #"superset::custom_security_manager" => '',
       #"superset::cwd" => '',
       #"superset::dburi" => '',
       #"superset::debug" => '',
       #"superset::default_db_id" => '',
       #"superset::dev" => '',
       #"superset::displa_sql_max_row" => '',
       #"superset::distribute" => '',
       #"superset::druid_analysis_types" => '',
       #"superset::druid_data_source_blacklist" => '',
       #"superset::druid_is_active" => '',
       #"superset::druid_tz" => '',
       #"superset::email" => '',
       #"superset::email_notifications" => '',
       #"superset::enable_celery" => '',
       #"superset::enable_cors" => '',
       #"superset::enable_proxy_fix" => '',
       #"superset::enable_time_rotate" => '',
       #"superset::filename" => '',
       #"superset::firstname" => '',
       #"superset::flask_use_reload" => '',
       #"superset::group" => '',
       #"superset::gunicorn" => '',
       #"superset::http_headers" => '',
       #"superset::img_upload_folder" => '',
       #"superset::img_upload_url" => '',
       #"superset::inteval" => '',
       #"superset::jinja_context_addons" => '',
       #"superset::lastname" => '',
       #"superset::ldap" => '',
       #"superset::log_format" => '',
       #"superset::log_level" => '',
       #"superset::mapbox_api_key" => '',
       #"superset::max_table_names" => '',
       #"superset::owner" => '',
       #"superset::password" => '',
       #"superset::pip" => '',
       #"superset::pippkg" => '',
       #"superset::public_role_line_gamma" => '',
       #"superset::query_search_limit" => '',
       #"superset::requirements" => '',
       #"superset::results_backend" => '',
       #"superset::robot_permissons_roles" => '',
       #"superset::rollover" => '',
       #"superset::row_limit" => '',
       #"superset::secre_key" => '',
       #"superset::show_stacktrace" => '',
       #"superset::silence_fab" => '',
       #"superset::smtp_host" => '',
       #"superset::smtp_mail_from" => '',
       #"superset::smtp_password" => '',
       #"superset::smtp_port" => '',
       #"superset::smtp_ssl" => '',
       #"superset::smtp_starttls" => '',
       #"superset::smtp_user" => '',
       #"superset::sql_celery_db_file_path" => '',
       #"superset::sql_celery_results_db_file_path" => '',
       #"superset::sql_max_row" => '',
       #"superset::sqlalchemy_track_modifications" => '',
       #"superset::sqllab_async_time_limit_sec" => '',
       #"superset::sqllab_default_dbid" => '',
       #"superset::sqllab_timeout" => '',
       #"superset::stats_logger" => '',
       #"superset::superset_celery_workers" => '',
       #"superset::superset_webserver_address" => '',
       #"superset::superset_webserver_port" => '',
       #"superset::superset_webserver_timeout" => '',
       #"superset::superset_workers" => '',
       #"superset::systempkgs" => '',
       #"superset::table_names_cache_config" => '',
       #"superset::time_rotate_log_devel" => '',
       #"superset::timeout" => '',
       #"superset::upload_folder" => '',
       #"superset::username" => '',
       #"superset::venv" => '',
       #"superset::venv_dir" => '',
       #"superset::venv_name" => '',
       #"superset::venv_version" => '',
       #"superset::version" => '',
       #"superset::virtualenv" => '',
       #"superset::viz_row_limit" => '',
       #"superset::viz_type_blacklist" => '',
       #"superset::warning_msg" => '',
       #"superset::wtf_csrf_enabled" => '',
       #"superset::yumpkg" => '',
     
     }
  end
end

shared_context :hiera do
    # example only,
    let(:hiera_data) do
        {:some_key => "some_value" }
    end
end

shared_context :linux_hiera do
    # example only,
    let(:hiera_data) do
        {:some_key => "some_value" }
    end
end

# In case you want a more specific set of mocked hiera data for windows
shared_context :windows_hiera do
    # example only,
    let(:hiera_data) do
        {:some_key => "some_value" }
    end
end

# you cannot use this in addition to any of the hiera_data contexts above
shared_context :real_hiera_data do
    let(:hiera_config) do
       hiera_config_file
    end
end
