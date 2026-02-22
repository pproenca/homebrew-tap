class OtaTouchid < Formula
  desc "Over-the-air Touch ID authentication for remote Macs"
  homepage "https://github.com/pproenca/ota-touchid"
  url "https://github.com/pproenca/ota-touchid/releases/download/v0.1.3/ota-touchid-macos-arm64.tar.gz"
  version "0.1.3"
  sha256 "afc3f46cffcc202ab63b2f98c47739e037f44d7a2453e23b8583a5b013903b54"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "ota-touchid"
  end

  def caveats
    <<~EOS
      To set up the server (Mac with Touch ID):
        ota-touchid setup

      To pair a client (remote Mac):
        ota-touchid pair <psk>

      To authenticate:
        ota-touchid auth --reason sudo
    EOS
  end

  test do
    assert_match "OTA Touch ID", shell_output("#{bin}/ota-touchid help")
  end
end
