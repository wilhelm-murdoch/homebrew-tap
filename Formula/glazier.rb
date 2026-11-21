# The release workflow fills the @...@ placeholders with packaging/render.sh and pushes the result to the tap.
class Glazier < Formula
  desc "Declarative tmux workspaces from HCL profiles"
  homepage "https://github.com/wilhelm-murdoch/glazier"
  version "0.5.2"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-arm64.zip"
      sha256 "21d91127191ae7fab5370822db3f8d03a94b05b54c560add4eb4cd1fcba93756"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-darwin-amd64.zip"
      sha256 "13e76d20f1a2ac9d1878a0cbef804fff4a70f67774444cdb72362a23d82ade5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-arm64.zip"
      sha256 "4b7a589aa2c91a3acd3e321246655a1730900e401d66fcafb63ae22dcc3a5991"
    end

    on_intel do
      url "https://github.com/wilhelm-murdoch/glazier/releases/download/v#{version}/glaze-linux-amd64.zip"
      sha256 "6185771b20bb00394fb320a0dd3c6ebc001f26cac2ba2c504ddf3174dba10df2"
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
