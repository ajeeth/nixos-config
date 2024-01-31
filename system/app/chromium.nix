{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    extraOpts = {
      "BrowserSignin" = "0";
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
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
