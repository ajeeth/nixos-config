{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    extensions = [
      "cbnipbdpgcncaghphljjicfgmkonflee" # Axel Springer Blocker
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "hjdoplcnndgiblooccencgcggcoihigg" # Terms of Service; Didn’t Read
      #"gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
      "klbibkeccnjlkjkiokjodocebajanakg" # The Great Suspender
      #"fngmhnnpilhplaeedifhccceomclgfbg" # EditThisCookie
      "oboonakemofpalcgghocfoadofidjkkk" # KeePassXC-Browser
      "fploionmjgeclbkemipmkogoaohcdbig" # Page load time
      "feeoiklfggbaibpdhkkngbpkppdmcjal" # Tab Counter
      #"kglhbbefdnlheedjiejgomgmfplipfeb" # Jitsi Meetings
    ];
    extraOpts = {
      "BrowserSignin" = "0";
      "SyncDisabled" = true;
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
