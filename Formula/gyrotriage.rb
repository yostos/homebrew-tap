class Gyrotriage < Formula
  desc "Score DJI drone footage shake intensity and recommend Gyroflow parameters"
  homepage "https://github.com/yostos/gyrotriage"
  url "https://github.com/yostos/gyrotriage/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "fb1d42174d61a97f53c15575dc5ab86a0d7fcd39b73a4b463981b45b8318cc7b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "gyrotriage", shell_output("#{bin}/gyrotriage --help")
  end
end
