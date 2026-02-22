class AgentSim < Formula
  desc "Simulator automation for AI agents — tap, swipe, read accessibility trees"
  homepage "https://github.com/pproenca/agent-sim"
  url "https://github.com/pproenca/agent-sim/releases/download/v0.1.3/agent-sim-macos-arm64.tar.gz"
  sha256 "4b761b5ddf36cf84ad3de5f82b44597d0b3058a9230162de9cdb3576fb007bce"
  version "0.1.3"
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
