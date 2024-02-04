{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    extraOpts = {
      "BrowserSignin" = "1";
      "SyncDisabled" = false;
      "PasswordManagerEnabled" = true;
      "BuiltInDnsClientEnabled" = false;
      "DeviceMetricsReportingEnabled" = false;
      "ReportDeviceCrashReportInfo" = true;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "en-US"
      ];
      "CloudPrintSubmitEnabled" = false;
    };
  };
}
