# The release workflow fills the @...@ placeholders with packaging/render.sh and pushes the result to the tap.
class Glazier < Formula
  desc "Declarative tmux workspaces from HCL profiles"
  homepage "https://github.com/wilhelm-murdoch/glazier"
  version "0.5.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-arm64.zip"
      sha256 "17bc83e536eead5b49125f8e32b28e0d3cc3a63f698421a87dc687b3906fb677"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-amd64.zip"
      sha256 "08997a50a4ed98f26699c358c4aff5380caba5994b9b8b959932161b67e21e03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-arm64.zip"
      sha256 "b44ffff338c792bbeaf7e079ed4bf7ace5369e115c74ffe03df8f5c92ebfd66b"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-amd64.zip"
      sha256 "96476411ffac3e5fcb62399edfc3f4fdd675a861d1d7d796c3d5caac5a92c81f"
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
