class Ttt < Formula
  desc "Tiny Task Tool - A minimal TUI task manager for the terminal"
  homepage "https://github.com/yostos/tiny-task-tool"
  url "https://github.com/yostos/tiny-task-tool/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "beb5b17ec084b5d7289bd038424f97732ba8db0d89a4b67f2ca95dc7d6dd341e"
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
