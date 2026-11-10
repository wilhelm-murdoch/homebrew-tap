# The release workflow fills the @...@ placeholders with packaging/render.sh and pushes the result to the tap.
class Glazier < Formula
  desc "Declarative tmux workspaces from HCL profiles"
  homepage "https://github.com/wilhelm-murdoch/glazier"
  version "0.5.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-arm64.zip"
      sha256 "c93ecc77701d8fc729d51183e26df0971ceba1040a6369f2f2bdcf332d13151b"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-amd64.zip"
      sha256 "94e92b02ea528c3dfe7da3edb2b70119aa89dc66ef0994fef6cb8cbc85fedb27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-arm64.zip"
      sha256 "224a1ef25bf6463d094e19020c5ef8b4d2d19410429c391e37d732c5fa41e45d"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-amd64.zip"
      sha256 "c1d3c66bff6b822019f8f9c8c2b09a8bf20f833871bbf09dd77670837dcc77d0"
    end
  end

  def install
    bin.install "glaze"
    bash_completion.install "glaze.bash" => "glaze"
    zsh_completion.install "_glaze"
    fish_completion.install "glaze.fish"
    man1.install "glaze.1"
  end

  test do
    assert_match "Version: v#{version},", shell_output("#{bin}/glaze --version")
    assert_match "complete -c glaze", shell_output("#{bin}/glaze completion fish")
  end
end
