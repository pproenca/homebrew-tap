class AgentSim < Formula
  desc "Simulator automation for AI agents — tap, swipe, read accessibility trees"
  homepage "https://github.com/pproenca/agent-sim"
  url "https://github.com/pproenca/agent-sim/releases/download/v0.1.2/agent-sim-macos-arm64.tar.gz"
  sha256 "35eafd9381b05964e4ada3b448d6967a637f99674d4a26a55964c051acd2c7dd"
  version "0.1.2"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "agent-sim"

    # Dynamic frameworks must live alongside the real binary
    (libexec/"frameworks").install Dir["*.framework"]

    # Rewrite rpath so the binary finds frameworks in libexec/frameworks/
    system "install_name_tool", "-add_rpath", "#{libexec}/frameworks", bin/"agent-sim"
    system "codesign", "--force", "--sign", "-", bin/"agent-sim"
  end

  def caveats
    <<~EOS
      agent-sim requires:
        - Xcode (with iOS Simulator runtimes installed)
        - A booted iOS Simulator

      Quick start:
        open -a Simulator
        agent-sim status
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/agent-sim --help")
  end
end
