# frozen_string_literal: true

require 'language/node'

class VscodeCssLanguageserverBin < Formula
  version '1.4.0'
  desc 'Binary version published on npm of vscode-css-languageserver extracted from VSCode tree'
  homepage 'https://github.com/vscode-langservers/vscode-css-languageserver-bin#readme'
  url 'https://registry.npmjs.org/vscode-css-languageserver-bin/-/vscode-css-languageserver-bin-1.4.0.tgz'
  sha256 'daa006f74a6baa265e743811bf224003048144c805bc3a9dd3f8175d4815bced'

  plist_options startup: true

  depends_on 'node'

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
              <string>/usr/local/bin/node</string>
              <string>/usr/local/bin/css-languageserver</string>
              <string>--socket=2091</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>/tmp/javascript-typescript-langserver.stderr</string>
          <key>StandardOutPath</key>
          <string>/tmp/javascript-typescript-langserver.stdout</string>
      </dict>
      </plist>
    EOS
  end

  def install
    system 'npm', 'install', *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
