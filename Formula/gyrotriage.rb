class Gyrotriage < Formula
  desc "Score DJI drone footage shake intensity and recommend Gyroflow parameters"
  homepage "https://github.com/yostos/gyrotriage"
  url "https://github.com/yostos/gyrotriage/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "a7b4b4301ecaa6a569c613b8bb8a237e2acf92b06be4a5eb2ece257635027f9e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "gyrotriage", shell_output("#{bin}/gyrotriage --help")
  end
end
