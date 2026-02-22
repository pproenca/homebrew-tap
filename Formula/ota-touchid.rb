class OtaTouchid < Formula
  desc "Over-the-air Touch ID authentication for remote Macs"
  homepage "https://github.com/pproenca/ota-touchid"
  url "https://github.com/pproenca/ota-touchid/releases/download/v0.1.4/ota-touchid-macos-arm64.tar.gz"
  version "0.1.4"
  sha256 "ae54fe5d66795fc12c1af050cc92455c6962b3766118e2ad66972e56f98f0fff"
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
