class Speak < Formula
  desc "Like say(1), with the best open text-to-speech model, running locally"
  homepage "https://github.com/peetzweg/speak"
  version "0.1.0"
  # speak is MIT OR Apache-2.0; the bundled espeak-ng is GPL-3.0-or-later.
  license all_of: [{ any_of: ["MIT", "Apache-2.0"] }, "GPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/peetzweg/speak/releases/download/v0.1.0/speak-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "dd53e61f51e006d0942e99a44d1036abe9d2b17764cfe87851c4b64c6e0d7a29"
  end

  on_linux do
    on_intel do
      url "https://github.com/peetzweg/speak/releases/download/v0.1.0/speak-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac9e7269daa29021049af28307ef18dbe6cd978e2a43b219f24fa53908f830f1"
    end
    on_arm do
      url "https://github.com/peetzweg/speak/releases/download/v0.1.0/speak-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe73258bfe046838a3306f8c3d727f2a8adece6e3e5d7fd50d60436466aeb2e2"
    end
  end

  conflicts_with "espeak-ng", because: "both install a `speak` executable"

  def install
    bin.install "bin/speak"
    # speak finds its espeak-ng in <prefix>/libexec/speak, next to its own bin/.
    libexec.install "libexec/speak"
    prefix.install "LICENSE-MIT", "LICENSE-APACHE", "NOTICE", "licenses"
  end

  def caveats
    <<~EOS
      The first run downloads the Kokoro model (354 MB) into ~/.local/share/speak.
      For agents: `speak --background "Build finished"`, and `speak stop`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/speak --version")
    # The bundled espeak-ng reads the Spanish voice; no model is needed for --analyze.
    ENV["SPEAK_NO_DOWNLOAD"] = "1"
    assert_match "ˈola", shell_output("#{bin}/speak --analyze -v ef_dora hola")
  end
end
