DROP TABLE IF EXISTS gpr_reset_credentials_email;
DROP TABLE IF EXISTS gpr_reset_credentials_session;
DROP TABLE IF EXISTS gpr_update_email;
DROP TABLE IF EXISTS gpr_session;

CREATE TABLE gpr_session (
  gprs_id SERIAL PRIMARY KEY,
  gprs_plugin_name VARCHAR(256) NOT NULL,
  gprs_username VARCHAR(256) NOT NULL,
  gprs_name VARCHAR(512),
  gprs_email VARCHAR(512),
  gprs_code_hash VARCHAR(512),
  gprs_callback_url TEXT DEFAULT NULL,
  gprs_password_set SMALLINT DEFAULT 0,
  gprs_session_hash VARCHAR(512),
  gprs_token_hash VARCHAR(512),
  gprs_expires_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprs_issued_for VARCHAR(256), -- IP address or hostname
  gprs_user_agent VARCHAR(256),
  gprs_enabled SMALLINT DEFAULT 1
);
CREATE INDEX i_gprs_session_hash ON gpr_session(gprs_session_hash);
CREATE INDEX i_gprs_gprs_token_hash ON gpr_session(gprs_token_hash);
CREATE INDEX i_gprs_gprs_gprs_code_hash ON gpr_session(gprs_code_hash);

CREATE TABLE gpr_update_email (
  gprue_id SERIAL PRIMARY KEY,
  gprue_plugin_name VARCHAR(256) NOT NULL,
  gprue_username VARCHAR(256) NOT NULL,
  gprue_email VARCHAR(512),
  gprue_token_hash VARCHAR(512),
  gprue_expires_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprue_issued_for VARCHAR(256), -- IP address or hostname
  gprue_user_agent VARCHAR(256),
  gprue_enabled SMALLINT DEFAULT 1
);
CREATE INDEX i_gprue_token_hash ON gpr_update_email(gprue_token_hash);

CREATE TABLE gpr_reset_credentials_session (
  gprrcs_id SERIAL PRIMARY KEY,
  gprrcs_plugin_name VARCHAR(256) NOT NULL,
  gprrcs_username VARCHAR(256) NOT NULL,
  gprrcs_session_hash VARCHAR(512),
  gprrcs_callback_url TEXT DEFAULT NULL,
  gprrcs_expires_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprrcs_issued_for VARCHAR(256), -- IP address or hostname
  gprrcs_user_agent VARCHAR(256),
  gprrcs_enabled SMALLINT DEFAULT 1
);
CREATE INDEX i_gprrcs_session_hash ON gpr_reset_credentials_session(gprrcs_session_hash);

CREATE TABLE gpr_reset_credentials_email (
  gprrct_id SERIAL PRIMARY KEY,
  gprrct_plugin_name VARCHAR(256) NOT NULL,
  gprrct_username VARCHAR(256) NOT NULL,
  gprrct_token_hash VARCHAR(512),
  gprrct_callback_url TEXT DEFAULT NULL,
  gprrct_expires_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprrct_issued_for VARCHAR(256), -- IP address or hostname
  gprrct_user_agent VARCHAR(256),
  gprrct_enabled SMALLINT DEFAULT 1
);
CREATE INDEX i_gprrct_token_hash ON gpr_reset_credentials_email(gprrct_token_hash);
