{ self, super }:

super.buildGoModule rec {
  name = "twlinst";
  version = "3d1d4e2b19e14df2ee855c4b6c391e6fe381eb2c";

  src = super.fetchFromGitHub {
    owner = "twitchylinux";
    repo = "twlinst";
    rev = "${version}";
    sha256 = "0i9wj61cwz1ln8l7p44dw0nilv0kk9q4081k306rkgah4anrgdxa"; # use nix-prefetch-git
  };

  vendorSha256 = "sha256-FKB3YiM/zkkW5olfnaCw4AYI7YvcpvLyLSP6xHMd5mY=";

  nativeBuildInputs = [ super.pkg-config ];
  buildInputs = [ super.gtk3 ];

  postInstall = ''
    cp -v layout.glade $out/twlinst.glade
  '';

  meta = with super.lib; {
    description = "Graphical installer for twitchylinux.";
    license = licenses.bsd3;
    platforms = platforms.unix;
  };
}
