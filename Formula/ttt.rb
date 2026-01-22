class Ttt < Formula
  desc "Tiny Task Tool - A minimal TUI task manager for the terminal"
  homepage "https://github.com/yostos/tiny-task-tool"
  url "https://github.com/yostos/tiny-task-tool/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "191dc9550a3e68884fd6e8bd7096b7ce005df555cb2e30aa0f62c76f97cb87de"
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
