{ stdenv
, lib
, fetchFromGitLab
, cmake
, meson
, pkg-config
, scdoc
, libusb1
}: stdenv.mkDerivation {
  pname = "rkdeveloptool";
  version = "unstable-2021-09-20";

  src = fetchFromGitLab {
    owner = "pine64-org/quartz-bsp";
    repo = "rkdeveloptool";
    rev = "cce7d2a5c4efd4e7727c440868141229354b327b";
    hash = "sha256-P6wEUhyVsM1eolkYPvjRUXGOytsh8dUt889TWkUqCVo=";
  };

  patches = [
    # fix length wrapping when reading data amounts over 4GiB
    ./0001-fix-large-dumps.patch
    # transfer more sectors at a time to double the transfer spede
    ./0001-speed-up-xfer.patch
  ];

  nativeBuildInputs = [ cmake meson pkg-config scdoc ];

  buildInputs = [ libusb1 ];
}
