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
  url "https://github.com/pproenca/mutate4swift/releases/download/v0.1.3/mutate4swift-macos-arm64.tar.gz"
  sha256 "3e935d826ce851389b445d234c9f51dd6b203b921ca1abaf820732878b670e6e"
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
