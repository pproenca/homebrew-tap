class AgentSim < Formula
  desc "Simulator automation for AI agents — tap, swipe, read accessibility trees"
  homepage "https://github.com/pproenca/agent-sim"
  url "https://github.com/pproenca/agent-sim/releases/download/v0.1.7/agent-sim-macos-arm64.tar.gz"
  sha256 "fe9647b9054f25eade41ee6a60828a2963279d96e59723abdccd2beee8632904"
  version "0.1.7"
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
