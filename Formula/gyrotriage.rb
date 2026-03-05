class Gyrotriage < Formula
  desc "Score DJI drone footage shake intensity and recommend Gyroflow parameters"
  homepage "https://github.com/yostos/gyrotriage"
  url "https://github.com/yostos/gyrotriage/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7ade75068b5262c479ad3612feb415bf824726e16235148d20f6e289b77fe3ed"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "gyrotriage", shell_output("#{bin}/gyrotriage --help")
  end
end
