# frozen_string_literal: true

require 'language/node'

class VimLanguageServer < Formula
  version '2.1.0'
  desc 'vim language server'
  homepage 'https://github.com/iamcco/vim-language-server#readme'
  url 'https://registry.npmjs.org/vim-language-server/-/vim-language-server-2.1.0.tgz'
  sha256 '262a770d25ce82d48548b0a423c8114ead6a30d327d09ad24b3950c1386e99ef'

  depends_on 'node'

  def install
    system 'npm', 'install', *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
