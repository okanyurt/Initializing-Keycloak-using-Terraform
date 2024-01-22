terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.4.0"
    }
  }
}

provider "keycloak" {
    client_id     = "admin-cli"
    username      = "user"
    password      = "xxx"
    url           = "http://localhost:81"
}

resource "keycloak_realm" "realm" {
    ##general
  realm             = "demo"
  enabled           = true
  display_name      = "Demo"
  display_name_html = "<b>Demo</b>"
  ssl_required    = "external"
  password_policy = "upperCase(1) and length(8) and forceExpiredPasswordChange(365) and notUsername"
  attributes      = {
    mycustomAttribute = "myCustomValue"
  }

  ##login
  login_with_email_allowed = true
  verify_email = true
  edit_username_allowed = true

##themes
  login_theme = "monster-themes"

  access_code_lifespan = "1h"

  security_defenses {
    headers {
      x_frame_options                     = "SAMEORIGIN"
      content_security_policy             = "frame-src 'self'; frame-ancestors 'self'; object-src 'none';"
      content_security_policy_report_only = ""
      x_content_type_options              = "nosniff"
      x_robots_tag                        = "none"
      x_xss_protection                    = "1; mode=block"
      strict_transport_security           = "max-age=31536000; includeSubDomains"
    }
    # brute_force_detection {
    #   permanent_lockout                 = false
    #   max_login_failures                = 30
    #   wait_increment_seconds            = 60
    #   quick_login_check_milli_seconds   = 1000
    #   minimum_quick_login_wait_seconds  = 60
    #   max_failure_wait_seconds          = 900
    #   failure_reset_time_seconds        = 43200
    # }
  }
  
  ##session
  sso_session_idle_timeout = "30m"
  sso_session_max_lifespan = "10h"

  revoke_refresh_token = true

  web_authn_policy {
    relying_party_entity_name = "Example"
    relying_party_id          = "keycloak.example.com"
    signature_algorithms      = ["ES256", "RS256"]
  }
}
