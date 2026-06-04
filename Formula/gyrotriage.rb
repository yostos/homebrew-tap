class Gyrotriage < Formula
  desc "Score DJI drone footage shake intensity and recommend Gyroflow parameters"
  homepage "https://github.com/yostos/gyrotriage"
  url "https://github.com/yostos/gyrotriage/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "c84501b17a07bdc72229ddcff531acdb467a282a6f4b411bc6f897b6f99e255c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "gyrotriage", shell_output("#{bin}/gyrotriage --help")
  end
end
