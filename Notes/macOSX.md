softwareupdate --agree-to-license
xcode-select --install
softwareupdate --install-rosetta




        <key>LaunchEvents</key>
        <dict>
            <key>com.apple.reachability</key>
            <dict>
               <key>default route keepalive</key>
               <dict>
                  <key>KeepAlive</key>
                  <true/>
                  <key>Target</key>
                  <string>0.0.0.0</string>
               </dict>
            </dict>
        </dict>
