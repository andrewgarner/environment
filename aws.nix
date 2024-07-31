{
  programs = {
    awscli = {
      enable = true;
      settings = {
        "default" = {
          region = "eu-west-2";
        };

        "profile AndrewGarner-AdministratorAccess" = {
          sso_account_id = "767397922954";
          sso_role_name = "AdministratorAccess";
          sso_session = "AndrewGarner";
        };

        "sso-session AndrewGarner" = {
          sso_region = "eu-west-2";
          sso_registration_scopes = "sso:account:access";
          sso_start_url = "https://andrewgarner.awsapps.com/start";
        };
      };
    };
  };
}
