class Ttt < Formula
  desc "Tiny Task Tool - A minimal TUI task manager for the terminal"
  homepage "https://github.com/yostos/tiny-task-tool"
  url "https://github.com/yostos/tiny-task-tool/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "0c0d651e9299a2fc5491d4e09c245f771461e80e0bad5ac8505659c3a717ed3f"
  license "MIT"
  head "https://github.com/yostos/tiny-task-tool.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/yostos/tiny-task-tool/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ttt --version")
  end
end
