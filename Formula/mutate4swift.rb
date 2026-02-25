# Homebrew formula for mutate4swift
# Install: brew install pproenca/tap/mutate4swift
#
# To set up the tap:
#   1. Create repo github.com/pproenca/homebrew-tap
#   2. Copy this file to Formula/mutate4swift.rb
#   3. Update the url and sha256 for each release
#
class Mutate4swift < Formula
  desc "Mutation testing tool for Swift Package Manager projects"
  homepage "https://github.com/pproenca/mutate4swift"
  url "https://github.com/pproenca/mutate4swift/releases/download/v0.1.1/mutate4swift-macos-arm64.tar.gz"
  sha256 "edcb95825d327b1abc81f8220e9f3463b9f8ea50c0fda37dcbaf5e17fb82703f"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "mutate4swift"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/mutate4swift --help", 0)
  end
end
