{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy badger
      "oboonakemofpalcgghocfoadofidjkkk" # KeePassXC-Browser
      "fploionmjgeclbkemipmkogoaohcdbig" # Page load time
      #"hjdoplcnndgiblooccencgcggcoihigg" # Terms of Service; Didn’t Read
      #"gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
      #"klbibkeccnjlkjkiokjodocebajanakg" # The Great Suspender
      #"fngmhnnpilhplaeedifhccceomclgfbg" # EditThisCookie
      #"feeoiklfggbaibpdhkkngbpkppdmcjal" # Tab Counter
      #"kglhbbefdnlheedjiejgomgmfplipfeb" # Jitsi Meetings
    ];
  };
}
