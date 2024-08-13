{ lib, fetchFromGitHub, rustPlatform, gnuplot }:

rustPlatform.buildRustPackage rec {
  pname = "rasn";
  version = "0.16.2";

  src = fetchFromGitHub {
    owner = "librasn";
    repo = pname;
    rev = "84e5eb5c53ecc82218079a5a61b9ad465a4a5157";
    hash = "sha256-ffy10t8OmpNkMZ/hMlM0kzFC8VMtuUa7TTS1zHtJYEE=";
  };

  nativeCheckInputs = [ gnuplot ];

  cargoHash = "sha256-pF5vUaf2iuH79M77g96umPg55JIf8Ys4WO6frAnrR0k=";

  patches = [ ./disabletests.patch ];

  meta = {
    description = "A safe #[no_std] ASN.1 codec framework that enables you to safely create, share, and handle ASN.1 data types from and to different encoding rules";
    homepage = "https://github.com/librasn/rasn";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ imadnyc ];
  };
}
